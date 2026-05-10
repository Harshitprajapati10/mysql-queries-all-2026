# Library Dataset Preprocessing

This project performs preprocessing on the raw library dataset stored in:

```bash
data/combinedlibrary.csv
```

The preprocessing pipeline performs the following tasks:

1. Add proper column names
2. Split rows based on presence of accession number
3. Sort records with accession number
4. Remove duplicate rows
5. Save the cleaned final dataset

---

# Directory Structure

```bash
project/
│
├── data/
│   ├── combinedlibrary.csv
│   │
│   ├── processed/
│   │   ├── combinedlibrary_processed.csv
│   │   ├── with_accession_no.csv
│   │   ├── without_accession_no.csv
│   │   └── with_accession_no_sorted.csv
│   │
│   └── final/
│       └── combinedlibrary_final.csv
│
├── scripts/
│   ├── split_csv.py
│   ├── sort_wrt_accession_no.py
│   └── remove_duplicates.py
│
└── README.md
```

---

# Initial Dataset

The raw dataset:

```bash
data/combinedlibrary.csv
```

contains:

- 12 columns
- No column names
- Some rows have missing accession numbers
- Some duplicate rows may exist

---

# Column Names Added

The following column names are assigned during preprocessing:

| Column Index | Column Name |
|---|---|
| 1 | acession_no |
| 2 | book_title |
| 3 | author |
| 4 | price_inr |
| 5 | price_dollar |
| 6 | price_euro |
| 7 | publisher |
| 8 | issued |
| 9 | number_donated |
| 10 | book_shelf_no |
| 11 | compartment_no |
| 12 | no_copies |

---

# Step-by-Step Preprocessing Pipeline

---

## Step 1: Add Column Names and Split Dataset

### Script

```bash
scripts/split_csv.py
```

### Input

```bash
data/combinedlibrary.csv
```

### What This Script Does

- Reads the raw CSV file
- Assigns proper column names
- Creates a processed dataset
- Splits the dataset into:
  - rows WITH accession number
  - rows WITHOUT accession number

### Output Files

#### Processed Dataset

```bash
data/processed/combinedlibrary_processed.csv
```

#### Rows With Accession Number

```bash
data/processed/with_accession_no.csv
```

#### Rows Without Accession Number

```bash
data/processed/without_accession_no.csv
```

---

## Step 2: Sort Dataset by Accession Number

### Script

```bash
scripts/sort_wrt_accession_no.py
```

### Input

```bash
data/processed/with_accession_no.csv
```

### What This Script Does

- Reads rows containing accession numbers
- Converts accession numbers into numeric format
- Sorts rows in ascending order based on accession number

### Output File

```bash
data/processed/with_accession_no_sorted.csv
```

---

## Step 3: Remove Duplicate Rows

### Script

```bash
scripts/remove_duplicates.py
```

### Input

```bash
data/processed/with_accession_no_sorted.csv
```

### What This Script Does

- Reads the sorted dataset
- Removes duplicate rows
- Saves the cleaned dataset

### Output File

```bash
data/final/combinedlibrary_final.csv
```

---

# Final Output

The final cleaned dataset is stored in:

```bash
data/final/combinedlibrary_final.csv
```

This dataset:

- Contains proper column names
- Contains only rows with accession numbers
- Is sorted by accession number
- Has duplicate rows removed

---

# Workflow Summary

```text
combinedlibrary.csv
        │
        ▼
split_csv.py
        │
        ├── combinedlibrary_processed.csv
        ├── with_accession_no.csv
        └── without_accession_no.csv
                    │
                    ▼
      sort_wrt_accession_no.py
                    │
                    ▼
      with_accession_no_sorted.csv
                    │
                    ▼
         remove_duplicates.py
                    │
                    ▼
      combinedlibrary_final.csv
```

---

# How to Run

Run the scripts in the following order:

## 1. Split Dataset

```bash
python scripts/split_csv.py
```

## 2. Sort Dataset

```bash
python scripts/sort_wrt_accession_no.py
```

## 3. Remove Duplicates

```bash
python scripts/remove_duplicates.py
```

---

# YOUR WORK
## GO TO THE library_queries/ AND START RUNNING QUERIES NO TABLE REQUIRED , RUN DIRECTLY ON YOUR NEW DATABASE.