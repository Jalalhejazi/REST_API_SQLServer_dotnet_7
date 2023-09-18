# Keep it simple as possible 

## POC | Proof of Concept | REST API with dotnet 7 

- REST API with dotnet 7 | WebAPI Not MVC   	- Uses Swagger for automation | No manual documentation 
- Uses ./test/Test_Endpoint.http for test within Visual studio  | No extra tooling
- Uses ./setup_mssql_with_docker.ps1 for running MSSQL as container | No pollution 
- Uses one T-SQL Stored Procedure for CRUD | No Table access or SQL Injection 
- Uses Dapper (micro ORM) for data access  | No Entity Framework  



	