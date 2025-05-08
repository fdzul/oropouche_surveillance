
# Step 1. create the table ####
x <- tibble::tibble(localidad = c("Huixtla",
                             "Tapachula",
                             "Ariaga",
                             "Salina Cruz",
                             "Huatulco",
                             "Puerto Angel",
                             "Puerto Escondido",
                             "Acapulco",
                             "Zihuatanejo",
                             "Lazaro Cardenas",
                             "Manzanillo",
                             "Puerto Vallarta",
                             "San Blas",
                             "Mazatlán",
                             "Guaymas",
                             "Puerto Peñasco",
                             "La Paz",
                             "San Jose los cabos",
                             "Los Cabos San Lucas",
                             "Ensenada",
                             "Guerrero Negro",
                             "Topolobampo"),
               estado = c(rep("Chiapas", times = 3),
                          rep("Oaxaca", times = 4),
                          rep("Guerrero", times = 2),
                          "Michoacan",
                          "Colima",
                          "Jalisco",
                          "Nayarit",
                          "Sinaloa", 
                          "Sonora",
                          "Sonora",
                          rep("Baja California Sur", times = 3),
                          "Baja California",
                          "Baja California",
                          "Sinaloa"))


# Step 2. create the vector addreses ####
addresses <- paste(x$localidad,
                   x$estado,
                   "Mexico", sep = ",")


# Step 4. geocoding dataset ###
library(ggmap)
denhotspots::geocoden(infile = "data")


# Step 5. load the original dataset dataset #####
z <- readRDS("~/Dropbox/r_developments/r_talks/2025/oropouche_surveillance/data_temp_geocoded.rds")

# Step 6. save the geocoded dataset ####
denhotspots::save_geocoden(x = z,
                           y = x,
                           directory = "data",
                           loc = "culicoides_paraensis")


# maps ###
load("~/Dropbox/r_developments/r_talks/2025/oropouche_surveillance/data/geo_culicoides_paraensis.RData")

y |>
    sf::st_as_sf(coords = c("long", "lat"),
                 crs = 4326) |>
mapview::mapview()
