# Stage 1
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build

# Install the client-side library manager
RUN dotnet tool install -g Microsoft.Web.LibraryManager.Cli
ENV PATH="$PATH:/root/.dotnet/tools"

COPY libman.json ./
# Restore client-side and NuGet packages
RUN libman restore

COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the code
COPY . ./

# Build our application in preparation for deployment
RUN dotnet publish -c Release -o /app

# Stage 2
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "ASPNETCoreDemo.dll"]