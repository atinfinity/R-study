### kernlabライブラリ読み込み
library(kernlab)

### csv読み込み
data <- read.csv("linear_data.csv")

### データの行数を取得
data.rows <- nrow(data)

### 学習に用いる行番号を抽出
train.rows <- 10
train_ids <- c(1:train.rows)

### 学習データを作成
svm_training <- data[train_ids, ]

###予測データを作成
svm_predicting <- data[-train_ids, ]

### ksvm関数でトレーニングデータを学習(vanilladot = 線形)
train_svm <- ksvm(Class ~., data=svm_training, kernel="vanilladot")

### predict関数で予測データを評価
result_predict <- predict(train_svm, svm_predicting)
print(result_predict)

### 予測結果と正解との比較
t <- table(result_predict, svm_predicting$Class)
print(t)

### 空のwindowを用意
plot(x = 0:1, y = 0:1, type = "n")

### 学習データをプロット（）
n <- train.rows
for(i in 1:n){
  c <- svm_training$Class[i]
  if(c == "pos"){
    points(svm_training$X[i], svm_training$Y[i], pch = 22)
  }
  else{
    points(svm_training$X[i], svm_training$Y[i], pch = 15)
  }
}

### 予測データをプロット
l <- (data.rows - train.rows)
for(j in 1:l){
  c <- svm_predicting$Class[j]
  if(c == "pos"){
    points(svm_predicting$X[j], svm_predicting$Y[j], pch = 2)
  }
  else{
    points(svm_predicting$X[j], svm_predicting$Y[j], pch = 17)
  }
}

