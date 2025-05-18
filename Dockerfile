# שלב הבנייה
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY *.sln .
COPY HelloDevOps/*.csproj ./HelloDevOps/
COPY HelloDevOps.Tests/*.csproj ./HelloDevOps.Tests/

RUN dotnet restore

COPY . .
RUN dotnet publish HelloDevOps/HelloDevOps.csproj -c Release -o out

# שלב ההרצה
FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT ["dotnet", "HelloDevOps.dll"]

