import xlrd
import csv


def get_data_from_spreadsheet(fileName, sheetIndex):
    workbook = xlrd.open_workbook(fileName)
    sheets= workbook.sheet_names()
    worksheet = workbook.sheet_by_index(0)
    rows = worksheet.nrows - 1
    cols = worksheet.ncols - 1
    return _extractdatafromexcel(1, rows, 0, cols)


def _extractdatafromexcel(rowStartIndex, rowEndIndex, colStartIndex, colEndIndex):
    curr_row = rowStartIndex
    while curr_row <= rowEndIndex:
         cur_col = colStartIndex
         dataRow =[]
         while cur_col <= colEndIndex:
             value = worksheet.cell_value(curr_row, cur_col)
             dataRow.append(value)
             cur_col+=1
         curr_row += 1
         testData.append(dataRow)
    return testData