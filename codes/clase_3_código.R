####### Clase 3. Introducción a Tidyverse #######
# Metodología Cuantitativa, 2023

#| message: false
# Instalar paquetes y cargar librerias
if (!require("pokemon")) install.packages("pokemon")
library(pokemon)
library(tidyverse)

# Asignar conjunto de datos a objeto
data_poke <- pokemon

## 1. glimpse ----

data_poke |> glimpse()

## 2. select ----

# Seleccionamos por posición
data_poke |>
  select(2)

# Selección por nombre
data_poke |>
  select(pokemon)

# Posición - Varias columnas
data_poke |>
  select(2, 3, 6, 7)

# Nombre - Varias columnas
data_poke |>
  select(pokemon, species_id, base_experience, type_1)

# Posición - por rango
data_poke |>
  select(1:7, 19)

# Nombre - por rango
data_poke |>
  select(id:type_1, generation_id)

# Posición - por rango, negativa
data_poke |>
  select(-(1:7))

# Nombre - por rango, negativa
data_poke |>
  select(-(id:type_1))

data_poke |>
  select(everything(), -id, -url_image)

set.seed(1234) # Esta semilla permite replicar la selección aleatoria
data_poke |>
  select(-url_image) |>
  select(pokemon, last_col(), type_1) |>
  slice_sample(n = 10) # Selección aleatoria

data_poke |>
  select(id, pokemon, starts_with("type"))

data_poke |>
  select(id, pokemon, ends_with("ght"))

data_poke |>
  select(id, pokemon, contains("_"))

data_poke |>
  select(matches("^[a-z]*$"))

data_poke |>
  select(pokemon, num_range("type_", 1:2))

nombres_inicial <- c("id", "pokemon", "nombre_no_existe")
data_poke |> select(any_of(nombres_inicial)) # Si usáramos all_of daría error.

nombres <- names(data_poke) # Función names() entrega nombres de columnas del dataframe
data_poke |> select(any_of(nombres))

data_poke |> select(where(is.numeric))

data_poke |> select(where(is.character))

data_poke |> select(where(~ is.numeric(.x) && mean(.x, na.rm = T) > 50))

## 3. rename ----

data_poke |>
  rename(peso = weight,
         altura = height,
         primer_tipo = type_1) |>
  select(peso, altura, primer_tipo)

data_poke |>
  select(peso = weight,
         altura = height,
         primer_tipo = type_1)

nuevos_nombres <- c(id_pokemon = "id", id_especies = "species_id",
                    altura = "height", peso = "weight",
                    exp_base = "base_experience",
                    tipo_1 = "type_1", tipo_2 = "type_2")

data_poke |>
  rename(all_of(nuevos_nombres))

data_poke |>
  rename_with(~str_replace(.x, "_", "."))

data_poke |>
  relocate(generation_id, .after = pokemon)

data_poke |>
  relocate(generation_id, .before = pokemon)

data_poke |>
  relocate(generation_id, .before = starts_with("type"))

## 4. filter ----

# Respetar mayúsculas y minúsculas
# Selecciona todos los type_1 fuego
data_poke |>
  filter(type_1 == "fire")

# Selecciona todos los que no sean fuego en type_1
data_poke |>
  filter(type_1 != "fire")

# Selecciona cualquiera que sea ghost o steel en type_1
data_poke |>
  filter(type_1 %in% c("ghost", "steel"))

# Selecciona cualquiera que no sea agua, hierba o fuego en type_1
data_poke |>
  filter(!(type_1 %in% c("grass", "fire", "water")))

# Selecciona tipo hierba en type_1 de segunda generación
data_poke |>
  filter(type_1 == "grass" & generation_id == 2)

# Selecciona tipo hielo en type_1 o type_2
data_poke |>
  filter(type_1 == "ice" | type_2 == "ice")

# Selecciona pokémon terminados en "on"
data_poke |>
  filter(str_ends(pokemon, "chu"))

## 6. arrange ----

# Ascendente
data_poke |>
  arrange(attack) |>
  select(pokemon, attack)

# Por tipo y luego descendente por ataque
data_poke |>
  arrange(type_1, desc(attack)) |>
  select(pokemon, type_1, attack)

## 7. slice ----

data_poke |> slice(150)
data_poke |> slice(236:240)
# Partiendo desde el principio, los 5 primeros
data_poke |> slice_head(n = 5)
# Partiendo desde el final, los 5 primeros
data_poke |> slice_tail(n = 5)

set.seed(1234)
# Muestra aleatoria de 7 casos
data_poke |> slice_sample(n = 7)

