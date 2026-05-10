import pandas as pd

# =========================
# File Paths
# =========================
INPUT_FILE = "data/processed/with_accession_no_sorted.csv"

OUTPUT_FILE = "data/final/combinedlibrary_final.csv"

# =========================
# Read CSV
# =========================
df = pd.read_csv(INPUT_FILE)

# =========================
# Remove Duplicate Rows
# =========================
df_no_duplicates = df.drop_duplicates()

# =========================
# Save Cleaned File
# =========================
df_no_duplicates.to_csv(
    OUTPUT_FILE,
    index=False
)

print("Duplicate rows removed successfully!")
print(OUTPUT_FILE)

# Optional: Show row counts
print(f"Original rows: {len(df)}")
print(f"Rows after removing duplicates: {len(df_no_duplicates)}")