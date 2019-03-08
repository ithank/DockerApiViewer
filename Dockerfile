 # Sample contents of Dockerfile
 # Stage 1
 FROM microsoft/aspnetcore-build AS builder

 WORKDIR /src
 COPY . .
 ##RUN git clone https://github.com/ithank/DockerApiViewer.git src

 WORKDIR /src/DockerApiViewer
 #RUN dotnet publish -o /app/ -c Release

 # Stage 2
 FROM microsoft/aspnetcore
 
 MAINTAINER pv
 WORKDIR /app
 
 ENV ASPNETCORE_ENVIRONMENT Development

 COPY --from=builder /app .
 
 EXPOSE 80 
 ENTRYPOINT ["dotnet", "DockerApiViewer.dll"]

# docker run -d -p 4000:80 -v ./data:/app/data guique/DockerApiViewer
## docker run -d -p 4000:80 -v ./data:/app/data <maintainerName>/MvcMovieName:1