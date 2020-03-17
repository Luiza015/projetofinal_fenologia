Dados de fenologia Pteris congesta (fevereiro 2019-janeiro 2020)
Objetivos: 
  Gerar médias, desvios padrões e gráficos paraa examinar se existe relação entre a dinâmica das fenofases vegetativas e reprodutivas com variação das características abióticas (preciptação e temperatura).
Hipótese: preciptação e temperatura influenciam positivamente na fertilidade e natalidade.
Resultados esperados: em períodos com maior quantidade de chuva, a tendência é de ter mais folhas férteis assim como o surgimento de folhas novas e báculos. Nos períodos mais secos a probabilidade de mortalidade foliar é maior. 

Passos do script:
#Parte I e II
1- Criando objeto a partir da pasta.
2- Fazendo média de cada coluna da tabela.
3- Aplicando as funções head() e summary() para inspecionar todos os arquivos; head (cabeçalho); summary (média, mediana, etc).
4- Média das variáveis por mês usando as funções agreggate e tapply.
5- Fazendo curva de densidade- mostra a probabilidade de observar determinado valor. Em comparação ao histograma, no eixo y, ao invés de termos a frequência, temos a densidade probabilística.
6- Plot das curvas de densidade sobre o histograma.
7- Ao final da execucação de todos os gráficos, eles devem ser salvos como figura a partir da função: png("Figs/figura02.png", res = 300, width = 2400, height = 1200)
dados de como o gráfico foi feito
dev.off()


#Parte III
Essa parte foi um teste usando o pacote "circular" para tentar gerar dados iniciais com a análise circular, decidi deixar as informações, mesmo incompletas, para posteriomente com os dados completos de fenologia continuar os gráficos. 
