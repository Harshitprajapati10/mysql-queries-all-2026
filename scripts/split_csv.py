import os
import pandas as pd

# =========================
# Paths
# =========================
INPUT_FILE = "data/combinedlibrary.csv"

OUTPUT_DIR = "data/processed"
os.makedirs(OUTPUT_DIR, exist_ok=True)

PROCESSED_FILE = os.path.join(
    OUTPUT_DIR,
    "combinedlibrary_processed.csv"
)

WITH_ACCESSION_FILE = os.path.join(
    OUTPUT_DIR,
    "with_accession_no.csv"
)

WITHOUT_ACCESSION_FILE = os.path.join(
    OUTPUT_DIR,
    "without_accession_no.csv"
)

# =========================
# Column Names
# =========================
column_names = [
    "acession_no",
    "book_title",
    "author",
    "price_inr",
    "price_dollar",
    "price_euro",
    "publisher",
    "issued",
    "number_donated",
    "book_shelf_no",
    "compartment_no",
    "no_copies"
]

# =========================
# Read CSV
# =========================
df = pd.read_csv(
    INPUT_FILE,
    header=None
)

# Assign column names
df.columns = column_names

# =========================
# Save processed file
# =========================
df.to_csv(
    PROCESSED_FILE,
    index=False
)

# =========================
# Split data
# =========================

# Rows WITH accession number
with_accession = df[
    df["acession_no"].notna() &
    (df["acession_no"].astype(str).str.strip() != "")
]

# Rows WITHOUT accession number
without_accession = df[
    df["acession_no"].isna() |
    (df["acession_no"].astype(str).str.strip() == "")
]

# =========================
# Save split files
# =========================
with_accession.to_csv(
    WITH_ACCESSION_FILE,
    index=False
)

without_accession.to_csv(
    WITHOUT_ACCESSION_FILE,
    index=False
)

print("Files saved successfully!")
print(PROCESSED_FILE)
print(WITH_ACCESSION_FILE)
print(WITHOUT_ACCESSION_FILE)