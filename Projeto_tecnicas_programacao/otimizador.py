import math

def distance(point1, point2):
    """
    Calcula a distância entre dois pontos geográficos, usando a fórmula de Haversine.
    """
    try:
        lat1, lon1 = point1
        lat2, lon2 = point2
        R = 6371  # raio da Terra em quilômetros
        phi1 = math.radians(lat1)
        phi2 = math.radians(lat2)
        delta_phi = math.radians(lat2 - lat1)
        delta_lambda = math.radians(lon2 - lon1)

        a = (
            math.sin(delta_phi / 2) ** 2
            + math.cos(phi1) * math.cos(phi2) * math.sin(delta_lambda / 2) ** 2
        )
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

        d = R * c
        return d
    except Exception as e:
        print(f"Ocorreu um erro ao calcular a distância: {e}")


def nearest_neighbor(points):
    try:
        unvisited = set(
            range(1, len(points))
        )  # índices que representam os pontos não visitados
        current_point = 0
        route = [current_point]

        while unvisited:
            nearest = min(
                unvisited, key=lambda x: distance(points[current_point], points[x])
            )
            route.append(nearest)
            unvisited.remove(nearest)
            current_point = nearest

        route.append(0)  # Volta ao ponto inicial para fechar o ciclo
        print("Caminho mais curto está traçado")
        return route
    except Exception as e:
        print(f"Ocorreu um erro ao traçar o caminho mais curto: {e}")
