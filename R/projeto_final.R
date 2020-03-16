##Trabalho final Projeto de análise de dados em R##
#Fenologia de Pteris congesta#

#criando objeto com a pasta

files.path <- list.files (path = "data",
                          pattern = ".csv",
                          full.names = TRUE)
files.path
comp_media <- read.csv2(files.path)
comp_media
#fazendo a média de cada coluna da tabela

mean(comp_media$comp_folha_fertil)
mean(comp_media$comp_folha_esteril)
mean(comp_media$comp_folha_jovem)

#Aplicando as funções head() e summary() para inspecionar todos os arquivos; head (cabeçalho); summary (média, mediana, etc).

head (comp_media)
summary(comp_media)

#Qual a média das variáveis por espécie? Usando as funções agreggate e tapply

#media do comprimento de folha fértil por meses
tapply(X = comp_media$comp_folha_fertil, INDEX = list(comp_media$meses), FUN = mean)

#media do comprimento de folha estéril por meses

tapply(X = comp_media$comp_folha_esteril, INDEX = list(comp_media$meses), FUN = mean)

#media do comprimento de folha jovem por meses

tapply(X = comp_media$comp_folha_jovem, INDEX = list(comp_media$meses), FUN = mean)

#tem como fazer a mesma coisa mas com outra função, a aggregate

aggregate(x = comp_media$comp_folha_fertil, by = list(comp_media$meses), FUN = mean)
aggregate(x = comp_media$comp_folha_esteril, by = list(comp_media$meses), FUN = mean)
aggregate(x = comp_media$comp_folha_jovem, by = list(comp_media$meses), FUN = mean)

par(mfrow=c(1, 1))
#Curva de densidade- mostra a probabilidade de observar determinado valor. Em comparação ao histograma, no eixo y, ao invés de termos a frequência, temos a densidade probabilística.

hist(comp_media$comp_folha_fertil, freq = FALSE)
par(mfrow=c(1, 2))
#plot da curva de densidade
plot(density(comp_media$comp_folha_fertil))
#plot da curva de densidade sobre o histograma de densidade
hist(comp_media$comp_folha_fertil, freq = FALSE)
lines(density(comp_media$comp_folha_fertil), col="blue") #note que agora estamos usando a funcao o comando add=TRUE

hist(comp_media$comp_folha_esteril, freq = FALSE)
par(mfrow=c(1, 2))
#plot da curva de densidade
plot(density(comp_media$comp_folha_esteril))
#plot da curva de densidade sobre o histograma de densidade
hist(comp_media$comp_folha_esteril, freq = FALSE)
lines(density(comp_media$comp_folha_esteril), col="blue") #note que agora estamos usando a funcao o comando add=TRUE

hist(comp_media$comp_folha_jovem, freq = FALSE)
par(mfrow=c(1, 2))
#plot da curva de densidade
plot(density(comp_media$comp_folha_jovem))
#plot da curva de densidade sobre o histograma de densidade
hist(comp_media$comp_folha_jovem, freq = FALSE)
lines(density(comp_media$comp_folha_jovem), col="blue") #note que agora estamos usando a funcao o comando add=TRUE

boxplot(comp_folha_fertil ~ meses, data = comp_media)


####________________________________________####
files.path2  <- list.files (path = "data",
                          pattern = ".csv",
                          full.names = TRUE)
files.path2
precip_temp <- read.csv2(files.path[2])
precip_temp

hist(precip_temp$preciptacao_mm)
plot(precip_temp$preciptacao_mm)
title("Gráficos preciptação ao longo dos meses 2019")

plot(precip_temp$T_max_media)
title("Gráfico temp máxima 2019")

plot(precip_temp$T_min_media)
title("Gráfico temp mínima 2019")


