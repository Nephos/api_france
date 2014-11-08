#ApiFrance

ApiFrance is a simple ruby application to serve an api with cities, regions, departments of France.

## Configuration
Simply configure your ``db/database.yml`` and then run : ``rake create && rake migrate && rake seed``
It can take a while (38k records).

## Running
Then, run ``ruby api_france.rb`` and go to `localhost:8080/cities?id=1` for example.

## Work

## Api documentation
The api will return a Json like :  
```json  
{
  "count" => nbresults,
  "results" => {
    "id" => {
      "name" => ...
      ...
    }
  }
}
```

"..." correspond to the values of the elements. There are :  
* __cities__ id,name,zipcode,department_id,region_id  
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

## Api special parameters
You are also allowed to do research on the api via the following arguments :  
* [not defined yet]
