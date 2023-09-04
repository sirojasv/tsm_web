####### Clase 2. Tipos y Estructuras de datos en R #######
# Metodología Cuantitativa, 2023.

## 1. Conjunto de datos ----

estudiantes <- tibble::tibble(
  nombre = c("Ismael", "Andrea", "Ernesto",
             "Daniela", "David", "Magdalena",
             "Santiago"),
  apellido = c("Fernández", "Pérez", "Leal",
               "Núñez", "Espinoza", "Madrid",
               "Vergara"),
  edad = c(29, 45, 79,
           18, 63, 80,
           35),
  ppa = c(5.75, 6.12, 5.06,
          6.12, 4.73, 5.24,
          4.94),
  region = c("Región Metropolitana", "Región de La Araucanía", "Región de Arica y Parinacota",
             "Región de Valparaíso", "Región Metropolitana", "Región del Ñuble",
             "Región del Maule"),
  pais = c("Chile") # Noten que como solo hay un único valor, R lo recicla para asigarlo a todos.
  )
estudiantes

## 2. Explorar ----

dim(estudiantes) 
str(estudiantes)
names(estudiantes)
summary(estudiantes)
head(estudiantes, n = 2)
tail(estudiantes, n = 2)

## 3. Procesar ----

# Forma 1
estudiantes <- subset(estudiantes, select = -pais)
estudiantes

# Forma 2
estudiantes[, names(estudiantes) != "pais"] # Accedemos a los nombres que no sean "pais"

# Forma 1
estudiantes$serie_fav <- c("Game of Thrones", "Los Soprano", "Breaking Bad",
                           "Breaking Bad", "Dark", "Los 80", "The Boys")

# Forma 2
estudiantes["musica_fav"] <- c("Metal", "Reggeaton", "Trap",
                                "Música Clásica", "Ranchera", "Pop", "Jazz")

# Forma 2, pero creando a partir de una variable ya existente
# Para sobreescribir la variable, tendría que llamarla en la izquierda con el mismo nombre
estudiantes["edad_mas_1"] <- estudiantes$edad + 1
estudiantes

# Definimos otro dataframe que uniremos
filas <- tibble::tibble(
  nombre = c("Pilar", "Julio"),
  apellido = c("Farías", "Martínez"),
  edad = c(52, NA),
  ppa = c(6.5, 5.14),
  region = c("Región de Antofagasta", "Región Metropolitana"),
  serie_fav = NA,
  musica_fav = c("Trap", "Hip hop"),
  edad_mas_1 = edad + 1
  )

estudiantes <- rbind(estudiantes, filas)
estudiantes

columnas <- tibble::tibble(
  carrera = c("Trabajo Social",
              "Ingeniería",
              "Construcción Civil",
              "Sociología",
              "Estadística",
              "Ciencia de Datos",
              "Odontología",
              "Letras",
              NA))

estudiantes <- cbind(estudiantes, columnas)
estudiantes

# Notar que dentro del paréntesis cuadrado lo que está antes de la coma está operando sobre las filas
# Luego, en la parte de las columnas no hay nada, pues se seleccionan todas
estudiantes <- estudiantes[order(estudiantes$edad), ]
estudiantes

estudiantes <- estudiantes[order(estudiantes$edad, decreasing = TRUE), ]
estudiantes

## 4. Variables tipo numéricas ----


mean(estudiantes$ppa)
median(estudiantes$ppa)
var(estudiantes$ppa)
sd(estudiantes$ppa)
range(estudiantes$ppa)
max(estudiantes$ppa)
min(estudiantes$ppa)

mean(estudiantes$edad) # Como tiene NA, retornará NA.
mean(estudiantes$edad, na.rm = TRUE)
sd(estudiantes$edad, na.rm = TRUE )

trunc(mean(estudiantes$edad, na.rm = TRUE))
round(mean(estudiantes$edad, na.rm = TRUE), digits = 2) # Dos decimales
ceiling(mean(estudiantes$edad, na.rm = TRUE))
quantile(estudiantes$ppa, probs = 0.10)
summary(estudiantes$ppa)

c(summary = summary(estudiantes$ppa), sd = sd(estudiantes$ppa))

c(media = mean(estudiantes$ppa), 
  mediana = median(estudiantes$ppa),
  devest = sd(estudiantes$ppa),
  min = min(estudiantes$ppa),
  max = max(estudiantes$ppa),
  rango = diff(range(estudiantes$ppa)), # En este caso diff es equivalente a restar.
  p10 = unname(quantile(estudiantes$ppa, prob = 0.10)),
  p25 = unname(quantile(estudiantes$ppa, prob = 0.25)),
  p75 = unname(quantile(estudiantes$ppa, prob = 0.75)),
  p90 = unname(quantile(estudiantes$ppa, prob = 0.90))
  )

## 5. Variables tipo caracter o string ----

estudiantes["nombre_apellido"] <- paste(estudiantes$nombre, estudiantes$apellido)
estudiantes[, c("nombre", "apellido")] <- NULL # Con NULL eliminamos completamente la columna nombre.

# En este caso al correr el código dará warning, pero no se preocupen
estudiantes[c("nombre", "apellido")] <- do.call(rbind, strsplit(estudiantes$nombre_apellido, split = " "))

estudiantes["nombre"] <- toupper(estudiantes$nombre)
estudiantes["apellido"] <- toupper(estudiantes$apellido)

estudiantes[c("nombre", "apellido")] <- lapply(
  X = estudiantes[c("nombre", "apellido")], FUN = toupper)
estudiantes

nchar(estudiantes$nombre)

print(paste(estudiantes$nombre, nchar(estudiantes$nombre), sep = ":"))

estudiantes["region_clean"] <- gsub("Región|Región de|Región del", "", estudiantes$region)
estudiantes$region_clean

estudiantes["region_clean"] <- trimws(estudiantes$region_clean)
estudiantes$region_clean

## 6. Factores ----

estudiantes$satisfaccion <-  c(1, 3, 4, 5, 2, 6, 4, 5, 5) # Ingresamos 9 valores porque la data de estudiantes son 9

# Notar que solo son 8 valores porque se definió un valor 6 que no existe en el factor.

estudiantes["satisfaccion"] <- factor(estudiantes$satisfaccion,
            levels = c(1, 2, 3, 4, 5),
            labels = c("Muy insatisfecho/a", "Insatisfecho/a", 
                       "Ni insatisfecho/a ni satisfecho/a",
                       "Satisfecho/a", "Muy satisfecho/a"))


## 7. Tablas ----

table(estudiantes$satisfaccion)
table(estudiantes$satisfaccion, useNA = "ifany") # Si se especifica ifany, mostrará los NA.
prop.table(table(estudiantes$satisfaccion)) 
round(prop.table(table(estudiantes$satisfaccion)) * 100, digits = 1)

tabla <- addmargins(round(prop.table(table(estudiantes$satisfaccion)) * 100, digits = 1))
cat(paste(names(tabla), tabla, sep = ": "), sep = "\n")

## 8. Bonus: paquetes cargados e información de sesión ----

options(OutDec = ",", # Decimales se muestran con coma
        scipen = 999) # Desahabilita notación científica

search()
sessionInfo()

