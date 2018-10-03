from numpy import *     

if __name__ == "__main__":
    n_iterations = 1000
    alpha = 0.0001
    N = 506
    points = genfromtxt("boston_housing_data.csv", delimiter=",")
    X = points[:, 1:12]
    y = points[:, 13]

    b_current = 0
    m_current = [0,0,0,0,0,0,0,0,0,0,0,0]

    print size(m_current)
    for i in range(n_iterations):
        for j in range(12):
            y_current = (m_current[j] * X) + b_current
            cost = sum([data**2 for data in (y-y_current)]) / (2*N)
            m_gradient = -(1/N) * sum(X * (y - y_current))
            b_gradient = -(1/N) * sum(y - y_current)
            m_current = m_current - (alpha * m_gradient)
            b_current = b_current - (alpha * b_gradient)
    
    print cost
