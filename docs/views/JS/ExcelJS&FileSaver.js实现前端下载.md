---
title: ExcelJS&FileSaver.js实现前端下载
date: 2023-04-16
sidebar: auto
tags: 
 - JS
categories:
 - JS
---

## ExcelJS
ExcelJS 是一个用于读取、操作和写入 Microsoft Excel (.xlsx) 文件的 Node.js 和浏览器库。它提供了丰富的 API 来创建、读取和修改 Excel 文件，支持多种格式化选项和复杂的工作表结构。   
### 主要特点
- 创建 Excel 文件：从头开始创建新的 Excel 文件。
- 读取 Excel 文件：读取现有的 Excel 文件并从中提取数据。
- 修改 Excel 文件：添加、删除或修改现有的工作表、单元格、样式等。
- 样式支持：支持各种单元格样式，包括字体、边框、填充等。
- 图表支持：支持创建和修改图表。
- 公式支持：支持在单元格中使用公式。
- 跨平台：既可以在 Node.js 环境中使用，也可以在浏览器环境中使用。

## FileSaver.js
FileSaver.js 是一个 JavaScript 库，用于在浏览器环境中保存 Blob 对象到用户的本地文件系统。它提供了一个简单的方法来创建和下载文件，而无需服务器端的支持。 
### 主要特点
- 跨浏览器兼容性：支持现代浏览器，包括 IE 10+。
- 易于使用：API 简洁，易于集成到现有的 JavaScript 代码中。
- 轻量级：库体积小，加载速度快。

## 示例
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ExcelJS & FileSaver.js Example</title>
</head>
<body>
    <button id="downloadButton">Download Excel</button>

    <script src="https://cdn.bootcdn.net/ajax/libs/exceljs/4.4.0/exceljs.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <script>
        document.getElementById('downloadButton').addEventListener('click', function () {
        // 创建一个新的工作簿
        let workbook = new ExcelJS.Workbook()
        let worksheet = workbook.addWorksheet('Sheet 1')

        // 添加一些列标题
        worksheet.columns = [
            { header: 'ID', key: 'id', width: 10 },
            { header: 'Name', key: 'name', width: 32 },
            { header: 'Value', key: 'value', width: 10 }
        ]

        // 添加一些数据行
        let data = [
            { id: 1, name: 'Test', value: 100 },
            { id: 2, name: 'Example', value: 200 },
            { id: 3, name: 'Sample', value: 300 }
        ]
        worksheet.addRows(data)

        // 将 Excel 文件写入 Buffer
        workbook.xlsx.writeBuffer().then(function (buffer) {
            // 使用 FileSaver.js 保存文件
            saveAs(new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' }), 'example.xlsx')
        })
    })
    </script>
</body>
</html>
```

