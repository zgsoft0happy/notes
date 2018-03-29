POI操作Execl

操作Execl,还可以使用jxl，但更多的是使用POI。
当文件后缀是xls时，只需包含依赖Poi，如果是xlsx则还需包含poi-ooxml包

## 读取Execl文件数据
1. 需要一个InputStrean来输入文件
	`InputStream is = new FileInputStream(fileName);`

2. 一个WorkBook类代表一个文件的输入流：
	`WorkBook wb = new HSSFWorkBook(is)` or
	`WorkBook wb = new XSSFWorkBook(is)`

3. 一个Sheet代表一个表，从0开始
	`Sheet sheet = wb.getSheetAt(i)`

4. 一个Row代表一行记录，从0开始
	`Row row = sheet.getRow(i)`
	
5. 一个Cell代表一个单元格，从0开始
	`Cell cell = row.getCell(i)`
	
6. Cell可以直接转换为字符串，但是注意数据的格式是Double格式的数据（数字的话）
	String cellValue = cell.toString();