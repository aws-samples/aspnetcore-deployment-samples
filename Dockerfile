# Stage 1
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app
# Stage 2
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS runtime
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "BeanstalkExampleCore.dll"]