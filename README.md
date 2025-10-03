# 出席状況チェックツール / Attendance Checker

履修者の出席状況を自動でチェックし、出席率を計算するRスクリプトです。

An R script for automatically checking student attendance and calculating attendance rates.

## 機能 / Features

- 履修者リストと出席者リストを比較
- 出席率の自動計算
- 欠席者の一覧表示
- 結果をCSVファイルで出力

- Compare enrolled students list with attendance list
- Automatic attendance rate calculation
- Display list of absent students
- Export results to CSV file

## 使い方 / Usage

### 1. データファイルの準備 / Prepare Data Files

以下の2つのCSVファイルを同じディレクトリに配置してください：

Place the following two CSV files in the same directory:

- `履修者データ入力.csv`: 履修者の学籍番号一覧（ヘッダー行なし）
- `出席者データ入力.csv`: 出席者の学籍番号一覧（ヘッダー行なし）

### 2. スクリプトの実行 / Run the Script

```r
# RまたはRStudioで実行
source("attendance_checker.R")
```

または

```bash
# コマンドラインから実行
Rscript attendance_checker.R
```

### 3. 結果の確認 / Check Results

- コンソールに出席状況サマリーが表示されます
- `出席状況_結果.csv`ファイルが生成されます

- Attendance summary will be displayed in console
- `出席状況_結果.csv` file will be generated

## 出力形式 / Output Format

### 出席状況フラグ / Attendance Status Flags
- `0`: 出席 (Present)
- `1`: 欠席 (Absent)

その他の出欠情報は、適宜手動で調整することを想定しています。

### CSV出力例 / CSV Output Example
```csv
学籍番号,出席状況
2024001,0
2024002,1
2024003,0
```

## サンプルデータ / Sample Data

このリポジトリにはサンプルデータが含まれています。実際の使用時は、個人情報を含むデータに置き換えてください。

This repository includes sample data. For actual use, replace with your own data containing personal information.
