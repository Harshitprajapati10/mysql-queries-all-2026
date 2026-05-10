import pandas as pd

# =========================
# File Paths
# =========================
INPUT_FILE = "data/processed/with_accession_no.csv"

OUTPUT_FILE = "data/processed/with_accession_no_sorted.csv"

# =========================
# Read CSV
# =========================
df = pd.read_csv(INPUT_FILE)

# =========================
# Sort by accession number
# =========================

# Convert accession number to numeric if possible
df["acession_no"] = pd.to_numeric(
    df["acession_no"],
    errors="coerce"
)

# Sort ascending
df_sorted = df.sort_values(
    by="acession_no"
)

# =========================
# Save sorted file
# =========================
df_sorted.to_csv(
    OUTPUT_FILE,
    index=False
)

print("Sorted file saved successfully!")
print(OUTPUT_FILE)