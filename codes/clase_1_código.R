####### Clase 1. Introducción a R #######
# Metodología Cuantitativa, 2023.

# 1. Vectores ----

# Definiendo mi primer vector numérico

v_numerico <- c(1, 3, 5, 7, 9)

# Entrega un vector con valores del 1 al 5
v_numerico_1 <- c(1:5)
v_numerico_1

# Entrega un vector con valores del 1 al 5, 9 al 7 y el número 256
v_numerico_2 <- c(1:5, 9:7, 256)
v_numerico_2

# Definiendo mi primer vector de caracteres
v_caracteres <- c("Hola Magíster de Trabajo Social", "Año 2023")

# Definiendo mi primer vector logico
v_logico <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Comprobando que es un vector
is.vector(v_numerico)

# Obteniendo el largo del vector
length(v_numerico)

# Comprobamos la clase del vector numérico
class(v_numerico)
typeof(v_numerico)

# Comprobamos la clase del vector de caracteres
class(v_caracteres)
typeof(v_caracteres)

# Comprobamos la clase del vector lógico
class(v_logico)
typeof(v_logico)

# Definiendo un vector numérico con NA
v_numerico_na <- c(5, 10, 33, 77, 101, 256, 5, NA, NA)

# Definiendo un vector de caracteres con NA
v_caracteres_na <- c("Hola", "Primera Clase", NA)

# Definiendo un vector lógico con NA
v_logico_na <- c(TRUE, FALSE, NA)

length(v_numerico_na)
length(v_caracteres_na)
length(v_logico_na)

# Acceder a la segunda posición
v_numerico[2]
v_caracteres[2]

# Acceder a la segunda posición
v_caracteres[2]

# Acceder a las tres primeras posiciones del vector
v_numerico[1:3]

# Accede siempre a la última posición sin conocer a priori su largo
v_numerico[length(v_numerico)]

# Accede siempre a la penúltima posición sin conocer a priori su largo.
v_numerico[length(v_numerico) - 1]

# Notar que en el vector definido no existe la posición 3
v_caracteres[3]

v_completo <- seq(from = 10, to = 50, by = 10)
v_completo

# Ahora eliminaremos el elemento que corresponda a la quinta posición
v_cortado <- v_completo[-4]
v_cortado

# Ahora al valor que corresponde a 50 le asignaremos el valor 90.
v_cortado[v_cortado == 50] <- 90
v_cortado

# Combinando vectores

mi_vector <- c("Los juegos")
mi_vector <- c(mi_vector, "del hambre")
# Notar que ahora este vector tiene dos elementos
mi_vector

# Creando vectores a partir de combinaciones de vectores
mi_vector_1 <- c(1, 3, 5, 7)
mi_vector_2 <- c(2, 4, 6, 8)
mi_vetor_3 <- c(mi_vector_1, mi_vector_2)
mi_vetor_3

# Al definirse tiene datos de distinto tipo
mi_vector_coercion <- c(40, "50 años", 33, "33") # Las comillas indican que es texto

# Pero R genera una coerción
class(mi_vector_coercion)

# Multiplicar el vector por 2
mi_vector_multiplicar <- c(2, 4, 6) * 2
mi_vector_multiplicar

# Vectores de distinto tipo
v_largo2 <- c(2, 3)
v_largo3 <- c(4, 5, 6, 8)
v_largo_com <- v_largo2 + v_largo3
v_largo_com

# 2. Matrices ----

matriz_1 <- matrix(1:9, ncol = 3) # Llenado por columnas
matriz_1

matriz_2 <- matrix(1:9, ncol = 3, byrow = TRUE) # Llenado por filas
matriz_2

v_parte_1 <- c(1:2)
v_parte_2 <- c(3:4)
v_parte_3 <- c(5:6)
v_parte_4 <- c(7:8)

matriz_columna <- cbind(v_parte_1, v_parte_2, v_parte_3, v_parte_4)
matriz_columna
matriz_fila <- rbind(v_parte_1, v_parte_2, v_parte_3, v_parte_4)
matriz_fila

matriz_2[1, 1] # Estoy seleccionando la fila 1 columna 1
matriz_2[2, 1] # Estoy seleccionando la fila 2 columna 1
matriz_2[1, ] # Estoy seleccionando a toda la fila 1
matriz_2[3, ] # Estoy seleccionando a toda la fila 3
matriz_2[, 1] # Estoy seleccionando a toda la columna 1

# 3. dataframes y tibbles ----

# Se definen los vectores de datos
nombre <- c("Constanza", "Sofia", "Gonzalo")
carrera <- c("Ingeniería", "Administración", "Arqueología")
gen <- c(2013, 2018, 2023)

# Generando una base de datos con data.frame()
data_estudiantes_df <- data.frame(nombre, carrera, gen)
data_estudiantes_df

# Generando una base de datos con tibble()
data_estudiantes_tb <- tibble(nombre, carrera, gen)
data_estudiantes_tb

data_estudiantes_tb$nombre # accedemos a la columna nombre con $. Esto devuelve un vector
data_estudiantes_tb["nombre"] # accedemos a la columna nombre con []. Esto devuelve un tibble
data_estudiantes_tb[["nombre"]] # accedemos a la columna nombre con[[]] Esto devuelve un vector
data_estudiantes_tb[[1]] # accedemos a la columna nombre con notación por posición [[]]

data_estudiantes_tb[1, "nombre"] # accedemos a la fila 1 de la columna nombre
data_estudiantes_tb[1:2, "nombre"] # accedemos a la fila 1 y 2 de la columna nombre
data_estudiantes_tb[[3, 1]] # Accedemos a la columna 3, fila 1
data_estudiantes_tb[1,] # Accedemos a toda la fila 1
data_estudiantes_tb[1,3] # Accedemos a la fila 1 columna 3

data_estudiantes_tb[, -c(1)] # accedemos a todas las columnas menos nombre, por posición
data_estudiantes_tb[, -c(1:2)] # accedemos a todas las columnas menos la 1 y la 2
data_estudiantes_tb[, names(data_estudiantes_tb) != "nombre"] # accedemos a todas las columnas menos nombre
data_estudiantes_tb[, !names(data_estudiantes_tb) %in% c("nombre", "carrera")]

