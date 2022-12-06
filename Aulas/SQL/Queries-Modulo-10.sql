# ST_GEOGPOINT, ST_DISTANCE, ST_X, ST_Y
SELECT 
  unique_key,
  latitude,
  longitude,
  location,
  ST_GEOGPOINT(longitude, latitude) as ponto_no_espaco,
  ST_GEOGPOINT(-97.7738652, 30.2667567) as ponto_parque,
  ST_DISTANCE(ST_GEOGPOINT(longitude, latitude), ST_GEOGPOINT(-97.7738652, 30.2667567)) as distancia_entre_solicitacao_e_parque,
  ST_X(ST_GEOGPOINT(-97.7738652, 30.2667567)) AS longitude_parque,
  ST_Y(ST_GEOGPOINT(-97.7738652, 30.2667567)) AS latitude_parque
FROM `bigquery-public-data.austin_311.311_request` 
where location is not null
LIMIT 100