using CRUDStoredProcedure.Interface;
using CRUDStoredProcedure.Models;
using CRUDStoredProcedure.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);


var connectionString = Environment.GetEnvironmentVariable("dbConnection", EnvironmentVariableTarget.User);

if (string.IsNullOrEmpty(connectionString))
{
    Console.WriteLine("Please set the connection string in the environment variable dbConnection");
    return;
}

builder.Services.AddDbContext<DatabaseContext>(options => options.UseSqlServer(connectionString));

builder.Services.AddTransient<IStudent, StudentRepository>();
builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();

const string ApiVersion = "v1";
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc(ApiVersion, new OpenApiInfo
    {
        TermsOfService = new Uri("https://www.termsfeed.com/terms-service-generator/"),
        Title = "Simple REST API for Learning purpose only (Maturity Model 2)",
        Version = ApiVersion,
        Description = "To learn more about Maturity Model <a href='https://github.com/Jalalhejazi/REST_0_1_2_3' target='!'>Follow this github repo</a> <br> <mark>No Security Best Practices !!</mark> ",

    });

});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(options =>
    {
        options.SwaggerEndpoint($"{ApiVersion}/swagger.json", "API Version " + ApiVersion);
        options.DefaultModelsExpandDepth(-1);
    });
}

app.MapControllers();

app.Run();