Log4j 之 PatternLayout -- Pattern

| 替换关键字 | 样式 | 说明 | 示例 |
| :-- | :-- | :-- | :-- |
| `c{precision}` or `logger{precision}` | `%c{1}` `%c{2}` `%c{-2}` `%c{1.}` `%c{1.1.~.~}` `%c{.}` | 替换发起当前log的类的类型 | |
| `C{precision}` or `class{precision}` | 同上 | 替换当前类的全类名（暂时没发现有什么区别） | |
| `d{pattern}` or `date{pattern}` | `%d{DEFAULT}` `%d{ISO6801}` `%d{ISO6801_BASIC}` `%d{ABSOLUTE}` `%d{DATE}` `%d{COMPACT}` `%d{HH:mm:ss,SSS}` `%d{dd MMM yyyy HH:mm:ss,SSS}` `%d{HH:mm:ss}{GMT+0}` `%d{UNIX}` `%d{UNIX_MILLIS}` | 按格式替换日期时间 | |
| `