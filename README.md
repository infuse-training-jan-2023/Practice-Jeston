Commands

Question 1:
  docker build -t pythondocker . 
  docker run pythondocker

Question2:
  docker build -t rubydocker .
  docker run rubydocker 
  
Question3:
  docker build -t rubyTest . 
  docker run rubyTest
  
Question5:
  docker build -t nodedocker . 
  docker run -p 3000:3000 nodedocker
  
Question6
  docker build -t backend . 
  docker run -d -p 3000:3000 backend
  
  docker build -t frontend
  docker run -d -p 3001:3001 frontend

  docker-compose up docker-compose up --build docker-compose down
