@echo off
chcp 65001
setlocal

:: Configura las variables de conexión
set "PGHOST=localhost"
set "PGPORT=5432"
set "PGUSER=adminzoo"
set "PGPASSWORD=Maldonado12478910"
set "PGDATABASE=zoologico"

:: Ejecuta cada archivo SQL en orden

echo Ejecutando create_schema.sql ...
psql -h %PGHOST% -p %PGPORT% -U %PGUSER% -d %PGDATABASE% -f "C:\Users\Kevin Ramirez\Documents\Git\GitHub\Kevin Ramirez\BDI-GB-ZOO\scripts\ddl\create_schema.sql"
if %errorlevel% neq 0 (
    echo Error ejecutando create_schema.sql
    exit /b %errorlevel%
)

echo Ejecutando create_tables.sql ...
psql -h %PGHOST% -p %PGPORT% -U %PGUSER% -d %PGDATABASE% -f "C:\Users\Kevin Ramirez\Documents\Git\GitHub\Kevin Ramirez\BDI-GB-ZOO\scripts\ddl\create_tables.sql"
if %errorlevel% neq 0 (
    echo Error ejecutando create_tables.sql
    exit /b %errorlevel%
)

echo Script ejecutado correctamente.
endlocal
pause