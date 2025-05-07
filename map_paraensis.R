
# Step 1. load the C. paraensis Dataset ####
load("~/Dropbox/projects/ETV/culicoides_paraensis/8.RData/records/culicoides_paraensis.RData")
# Step 1. load the maps ####
paraensis <- terra::rast("/Users/felipedzul/Dropbox/projects/ETV/culicoides_paraensis/09.output/pred_culicoides_paraensis_bio_crop.tif")


# Step 2. make ####
edos <- rgeomex::AGEE_inegi19_mx
#mpos <- rgeomex::AGEM_inegi19_mx


mapview::mapview(paraensis,
                 #col.regions = NA,
                 legend =T,
                 layer.name = "Probababilidad",
                 #alpha.regions = 0.0,
                 color = "gray90") +
        mapview::mapview(xy,
                         col.regions = "#4285F4",
                         color = "white",
                        layer.name = "Culicoides parensis") +
    mapview::mapview(edos,
                     alpha.regions = 0.0,
                     color = "gray80",
                     col.regions = NA)
 

