FROM python:3.13.5-alpine3.22

# Use a imagem oficial do Python com Alpine Linux como base
FROM python:3.10-slim-buster

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto para o diretório de trabalho
COPY . .

# Expoe a porta que a aplicação FastAPI ira rodar (padrão 8000)
EXPOSE 8000

# Define o comando de execução da aplicação usando Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

