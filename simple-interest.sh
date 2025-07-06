#!/bin/bash

# Calculadora de Interés Simple
# Fórmula: Interés Simple = (Principal × Tasa × Tiempo) / 100
# Autor: RamfiAogusto
# Fecha: 2024

echo "==============================="
echo "  CALCULADORA DE INTERÉS SIMPLE"
echo "==============================="
echo ""

# Función para validar entrada numérica
validate_number() {
    local input=$1
    local var_name=$2
    
    if ! [[ "$input" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: $var_name debe ser un número válido."
        return 1
    fi
    
    if (( $(echo "$input <= 0" | bc -l) )); then
        echo "Error: $var_name debe ser mayor que 0."
        return 1
    fi
    
    return 0
}

# Solicitar datos al usuario
while true; do
    echo -n "Ingresa el monto principal (cantidad inicial): $"
    read principal
    
    if validate_number "$principal" "El monto principal"; then
        break
    fi
done

while true; do
    echo -n "Ingresa la tasa de interés anual (%): "
    read rate
    
    if validate_number "$rate" "La tasa de interés"; then
        break
    fi
done

while true; do
    echo -n "Ingresa el tiempo en años: "
    read time
    
    if validate_number "$time" "El tiempo"; then
        break
    fi
done

# Calcular interés simple
# Fórmula: SI = (P × R × T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Calcular monto total
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc -l)

# Mostrar resultados
echo ""
echo "==============================="
echo "           RESULTADOS"
echo "==============================="
echo "Monto Principal: \$$principal"
echo "Tasa de Interés: $rate%"
echo "Tiempo: $time años"
echo "-------------------------------"
echo "Interés Simple: \$$simple_interest"
echo "Monto Total: \$$total_amount"
echo "==============================="
echo ""

# Mostrar fórmula utilizada
echo "Fórmula utilizada:"
echo "Interés Simple = (Principal × Tasa × Tiempo) / 100"
echo "Interés Simple = ($principal × $rate × $time) / 100"
echo "Interés Simple = \$$simple_interest"
echo ""

echo "¡Gracias por usar la calculadora de interés simple!"
echo "" 