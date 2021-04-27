
import pandas as pd  
from typing import List

def oh_encode(df: pd.DataFrame, cols: List[str] = ['payment_method'], drop: bool = False) -> pd.DataFrame:
    """ One hot encode a list of columns in a dataframe

    Args:
        df: The current dataframe in use
        cols: A list of column name to be one hot encoded 
        drop: True if the columns in the cols list should be dropped after OH encoding, otherwise false

    Returns:
        A new dataframe containing the one hot encoded columns
    """
    # make a copy of the df to avoid changing the original data  
    df = df.copy()
    for col in cols:
        # get OH encoded df and add concatenate it to the original df
        oh_col_df = pd.get_dummies(df[col])
        df = pd.concat([df, oh_col_df], axis=1)

    if drop:
        df.drop(columns=cols, inplace=True)
    
    return df

def extract_time(df: pd.DataFrame, col_name: str = 'created_at', drop: bool = True) -> pd.DataFrame:
    """ Extract date/time data from the created_at column

    Args: 
        df: The current dataframe in use
        col_name: The column to extract time data from
        drop: If true, drop the original time column 

    Returns: 
        A new dataframe containing new column with separate information about date and time
    """
    df = df.copy()
    
    # extract date info 
    df['day'] = df[col_name].dt.day
    df['month'] = df[col_name].month
    df['year'] = df[col_name].year
    df['weekday'] = df[col_name].weekday()

    # extract time info; ignore the seconds (different in seconds sholud not matter for orders)
    df['hours_time'] = df[col_name].hour + (df[col_name].minute / 60)

    if drop:
        df.drop(columns=[col_name], inplace=True)

    return df

test = pd.read_csv('q1_data_set.csv')
payment_df = oh_encode(test)
time_df = extract_time(payment_df)


print(time_df.head(30))