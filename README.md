#ApiFrance

ApiFrance is a simple ruby application to serve an api with cities, regions, departments of France.

## Configuration
Simply configure your ``db/database.yml`` and then run : ``rake db:create && rake db:migrate && rake db:seed``
It can take a while (38k records).

## Running
Then, run ``rake server`` and go to `http://localhost:8080/cities?id=1` for example.
Parameters are :  
* port <port> : port to use  

You can also go to the console and try your code with ``rake console``

## Work

## Api documentation
The api will return a Json like :  
```json  
{
  "count" => nbr_of_results_total,
  "results" => [
    {
      "id" =>
      "name" => ...
      ... => ...
    }
  ]
}
```

The "count" is without limit. An empty search will return count = maxium but limit the results by 1000 elements (by default)

"..." correspond to the values of the elements. There are :  
* __cities__ id,name,zipcode,department_id,region_id,longitude,latitude  
* __departments__ id,name,region_id  
* __regions__ id,name  

The api will not provide a full access to the data base. The number of result is basicaly limited by 1000.
It can be configured in the configuration.yml


## Api parameters

The api can scan 3 tables : cities, regions, departments.
So, the request must begin with on of theses.  
* ``E.g : http://api.local.dom/cities?param=x&param2=y``  

The arguments can be a value of the tables :  
* ``E.g : http://api.local.dom/cities?id=1`` will return the first city of the table (id = 1)  
* ``E.g : http://api.local.dom/department?name=var`` will return every department having their name = "var" (case insensitive)  

## Api special parameters
You are also allowed to do research on the api via the following arguments :  
* name_like : you can use this argument to do an advanced search through any table. The value of the parameter can have a '*' or '?' to replace (0+ / 1) other characters.  
* id_lesser / id_greater : search using the id. It is lesser or equal (not strict). Same for greater.  
They can be combined.  
* has_zipcode : when touching the cities table, this param will take every town having this zipcode. Muse be 5 digits length.
