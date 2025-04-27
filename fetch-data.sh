wget https://download.geofabrik.de/north-america/us-northeast-latest.osm.pbf &&
wget https://download.geofabrik.de/asia/japan/kyushu-latest.osm.pbf &&
osmium cat us-northeast-latest.osm.pbf kyushu-latest.osm.pbf -o data.osm.pbf
