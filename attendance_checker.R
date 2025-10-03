# =============================================================================
# 出席状況チェックスクリプト
# Attendance Checker Script
# =============================================================================
#
# 【使い方 / Usage】
# 1. 同じディレクトリに以下のCSVファイルを配置してください：
#    Place the following CSV files in the same directory:
#    - 履修者データ入力.csv : 履修者の学籍番号一覧（ヘッダー行なし）
#    - 出席者データ入力.csv : 出席者の学籍番号一覧（ヘッダー行なし）
#
# 2. Rまたは RStudio でこのスクリプトを実行：
#    Run this script in R or RStudio:
#    Rscript attendance_checker.R
#    または / or
#    source("attendance_checker.R")
#
# 3. 結果は以下のように出力されます：
#    Results will be output as follows:
#    - コンソール: 出席状況サマリーと欠席者一覧
#    - ファイル: 出席状況_結果.csv（学籍番号 + 出席状況フラグ）
#
# 【出席状況フラグ / Attendance Status Flags】
# 0: 出席 (Present)
# 1: 欠席 (Absent)
#
# =============================================================================

# CSVファイルの読み込み
履修者 <- read.csv("履修者データ入力.csv", header = FALSE, stringsAsFactors = FALSE)
出席者 <- read.csv("出席者データ入力.csv", header = FALSE, stringsAsFactors = FALSE)

# データの確認とヘッダー設定
colnames(履修者) <- "学籍番号"
colnames(出席者) <- "学籍番号"

# データ型の確認と統一
履修者$学籍番号 <- as.character(履修者$学籍番号)
出席者$学籍番号 <- as.character(出席者$学籍番号)

# 重複を除去（同じ学籍番号が複数回記録されている場合）
出席者_unique <- unique(出席者$学籍番号)

# デバッグ情報の出力
cat("履修者数:", nrow(履修者), "\n")
cat("出席者数:", length(出席者_unique), "\n")

# 履修者に出席フラグを追加
# 出席している場合は0、出席していない場合は1
出席状況 <- ifelse(履修者$学籍番号 %in% 出席者_unique, 0, 1)
履修者$出席状況 <- 出席状況

# 結果の確認
cat("=== 出席状況サマリー ===\n")
cat("履修者総数:", nrow(履修者), "\n")
cat("出席者数:", sum(履修者$出席状況 == 0), "\n")
cat("欠席者数:", sum(履修者$出席状況 == 1), "\n")
cat("出席率:", round(sum(履修者$出席状況 == 0) / nrow(履修者) * 100, 1), "%\n\n")

# 結果の表示
print("履修者の出席状況:")
print(履修者)

# 欠席者のリスト
欠席者 <- 履修者[履修者$出席状況 == 1, "学籍番号"]
if(length(欠席者) > 0) {
  cat("\n=== 欠席者一覧 ===\n")
  cat(paste(欠席者, collapse = ", "), "\n")
} else {
  cat("\n全員出席しています。\n")
}

# 結果をCSVファイルに保存
write.csv(履修者, "出席状況_結果.csv", row.names = FALSE)
cat("\n結果を '出席状況_結果.csv' に保存しました。\n")
