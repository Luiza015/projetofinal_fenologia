##Trabalho final Projeto de análise de dados em R##
#Fenologia de Pteris congesta#

###_________________________________###Parte I
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

#Qual a média das variáveis por mês? Usando as funções agreggate e tapply

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


####________________________________________####Parte II
files.path2  <- list.files (path = "data",
                          pattern = ".csv",
                          full.names = TRUE)
files.path2
precip_temp <- read.csv2(files.path[2])
precip_temp


#Para salvar figuras
png("Figs/figura01.png", res = 300, width = 2400, height = 1200)
hist(precip_temp$preciptacao_mm)
plot(precip_temp$preciptacao_mm)
title("Gráficos preciptação ao longo dos meses 2019")
dev.off()

png("Figs/figura02.png", res = 300, width = 2400, height = 1200)
plot(precip_temp$T_max_media)
title("Gráfico temp máxima 2019")
dev.off()

png("Figs/figura03.png", res = 300, width = 2400, height = 1200)
plot(precip_temp$T_min_media)
title("Gráfico temp mínima 2019")
dev.off()


###_______________________________________###Parte III
files.path3 <- list.files (path = "data/analise_circular",
                           pattern = ".csv",
                           full.names = TRUE)
files.path3
analise_circular <- read.csv2(files.path3)
analise_circular
#Para verificar se o arquivo foi lido corretamente
str(analise_circular)

#Istalando o pacote "circular" para que as análises sejam feitas
library(circular)

#A planilha deve ter uma coluna para os ângulos e colunas para os comprimentos
borda <- rep (analise_circular$ângulo, analise_circular$comp_folha_fertil)
interior <- rep (analise_circular$ângulo, analise_circular$comp_folha_esteril)

#Transformando os dados em radiano
borda.rad <- rad(borda)
interior.rad <- rad (interior)
#Transformando os dados em circulares
borda.circ <- as.circular(borda.rad)
interior.circ <- as.circular(interior.rad)

#Dessa maneira, foi criado dois vetores, cujos valores dos ângulos se repetem. Pode-se dessa maneira, começar a visualizar os dados. Para isso, colocar os dados no gráfico:

plot.circular(cbind(borda.circ, interior.circ), rotation = "clock", units = "rads")
rose.diag(cbind(interior.circ, borda.circ))
