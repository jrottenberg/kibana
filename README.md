# Kibana



## Usage

```
docker run -p 5601:5601 -e ELASTICSEARCH_URL=https://xyz.us-east-1.es.amazon:443  kibana
```

### Curator

```
# get current indices
docker run -it kibana curator_cli --host https://xyz.us-east-1.es.amazon:443 show_indices --verbose

# clean indices older than 12 days
docker run -it kibana  curator_cli --host ${ELASTICSEARCH_URL} delete_indices --ignore_empty_list --filter_list '[{"filtertype":"age","source":"creation_date","directio
n":"older","unit":"days","unit_count":12},{"filtertype":"pattern","kind":"prefix","value":"logstash"}]'
```


# Gotcha

Save yourself some tears, put the port for elasticsearch, ie : append `:443`
