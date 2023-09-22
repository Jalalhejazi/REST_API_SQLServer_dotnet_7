<mark>"Make everything as simple as possible, but not simpler." </mark> - Albert Einstein

## Learning | Proof of Concept | REST API with dotnet 7 

- REST API with dotnet 7 | WebAPI Not MVC   	
- Uses Swagger for automation | No manual documentation 
- Uses [automated test.http](./Test/Test_Endpoint.http) for test within Visual studio  | No extra tooling
- Uses [setup_mssql_with_docker.ps1](./setup_mssql_with_docker.ps1) for running MSSQL as container | No pollution 

- Uses Dapper (micro ORM) for data access on Stored Procedure | No Entity Framework on Tables   

- Uses one T-SQL Stored Procedure for CRUD as One Gateway | No Table access or SQL Injection 


## HTTP Verbs

| HTTP Verb | Description |
| --- | --- |
| GET | Retrieves data from the server. It should only retrieve data and should have no other effect. |
| POST | Sends data to the server for a new resource. It submits data to be processed by the identified resource. |
| PUT | Updates an existing resource or creates it if it doesn't exist. It replaces all the current representations of the target resource with the uploaded content. |
| DELETE | Removes the specified resource. |
| PATCH | Applies partial modifications to a resource. |
| HEAD | Similar to GET, but it only requests the headers that are returned if the specified resource would be returned by a GET request. This is useful for checking if a resource exists before actually downloading it. |
| OPTIONS | Returns the HTTP methods that the server supports for the specified URL. |
| CONNECT | Establishes a network connection for use with a proxy. |
| TRACE | Performs a message loop-back test along the path to the target resource. |


## HTTP verbs and their CRUD operations

| HTTP Verb | CRUD Operation | Description                                                                 |
|-----------|----------------|-----------------------------------------------------------------------------|
| POST      | CREATE         | Create a new resource.                                                      |
| GET       | READ           | Read an existing resource.                                                  |
| PUT       | UPDATE         | Update an existing resource.                                                |
| DELETE    | DELETE         | Delete an existing resource.                                                |
| PATCH     | UPDATE         | Update an existing resource.                                                |
| HEAD      | READ           | Read an existing resource.                                                  |
| OPTIONS   | READ           | Read an existing resource.                                                  |
| TRACE     | READ           | Read an existing resource.                                                  |
| CONNECT   | CREATE         | Create a new resource.                                                      |



## HTTP Status Codes (most common)

| Status Code | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| 200         | OK                                                                          |
| 201         | Created                                                                     |
| 202         | Accepted                                                                    |
| 204         | No Content                                                                  |
| 301         | Moved Permanently                                                           |
| 304         | Not Modified                                                                |
| 400         | Bad Request                                                                 |
| 401         | Unauthorized                                                                |
| 403         | Forbidden                                                                   |
| 404         | Not Found                                                                   |
| 405         | Method Not Allowed                                                          |
| 500         | Internal Server Error                                                       |
| 503         | Service Unavailable                                                         |
	




 



## Why using Stored Procedure | Not Tables 

Freedom to refactor and redesign after deployment  

| Reason Number | Benefit                  | Description                                                                                                                                                  |
|---------------|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1             | Security                 | Stored procedures restrict direct access to underlying tables, providing an additional layer of security.                                                      |
| 2             | Code Reusability         | Stored procedures encapsulate a sequence of operations, making it easier to reuse the same logic across multiple applications.                                 |
| 3             | Performance Optimization | Stored procedures are precompiled, leading to faster query performance compared to executing multiple SQL statements individually.                            |
| 4             | Transaction Management   | Stored procedures allow for easier management of transactions by including multiple SQL statements and controlling transaction logic within the procedure.    |
| 5             | Centralized Logic        | Using stored procedures centralizes the database logic, making it easier to manage and update. Any changes can be made in one place.                           |




## [Entity vs Data Transfer Object (DTO) Separation](https://chat.openai.com/share/8988e67f-68c6-42b3-acdd-8ea475193d3a)

![](https://user-images.githubusercontent.com/784478/268920000-4fc0736f-8b2b-4476-9f0e-583f814ece9d.png)

By separating the Entity model from the DTO model, especially in a stored procedure context, you are adding an additional layer of abstraction that allows for better flexibility, security, and maintainability.