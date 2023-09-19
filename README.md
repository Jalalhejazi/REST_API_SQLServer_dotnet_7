<mark>"Make everything as simple as possible, but not simpler." </mark> - Albert Einstein

## Learning | Proof of Concept | REST API with dotnet 7 

- REST API with dotnet 7 | WebAPI Not MVC   	
- Uses Swagger for automation | No manual documentation 
- Uses [automated test.http](./Test/Test_Endpoint.http) for test within Visual studio  | No extra tooling
- Uses [setup_mssql_with_docker.ps1](./setup_mssql_with_docker.ps1) for running MSSQL as container | No pollution 

- Uses Dapper (micro ORM) for data access on Stored Procedure | No Entity Framework on Tables   

- Uses one T-SQL Stored Procedure for CRUD as One Gateway | No Table access or SQL Injection 

 



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

