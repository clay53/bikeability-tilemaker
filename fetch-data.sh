wget https://download.geofabrik.de/north-america/us-northeast-latest.osm.pbf -O us-northeast-latest.osm.pbf &&
wget https://download.geofabrik.de/north-america/us-south-latest.osm.pbf -O us-south-latest.osm.pbf &&
wget https://download.geofabrik.de/asia/japan/kyushu-latest.osm.pbf -O kyushu-latest.osm.pbf &&
osmium cat us-northeast-latest.osm.pbf us-south-latest.osm.pbf kyushu-latest.osm.pbf -o data.osm.pbf --overwrite
