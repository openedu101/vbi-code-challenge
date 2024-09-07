# Bài thi của Pich

## Mô tả ngắn về bài thi
Bài thi này bao gồm ba Sc: `AutoWallet`, `ContributionCounter`, và `SimpleTimeLock`. Mỗi contract đều có các feature riêng biệt nhằm phục vụ cho việc quản lý tài sản và transfer trên EVM.

## Tự đánh giá

- **Tính chính xác**: 
  - Các contract đã được kiểm tra kỹ lưỡng và hoạt động chính xác theo yêu cầu. Các lỗi được xử lý rõ ràng, đảm bảo rằng user không thể thực hiện các hành động không hợp lệ (verified contract).

- **Hiệu suất**: 
  - contract được tối ưu hóa để giảm thiểu chi phí gas. Các logic được build rõ ràng.

- **Code Style & Clean Code**: 
  - Source code được viết rõ ràng, dễ đọc và tuân thủ các quy tắc coding tốt. Các biến và fun được đặt tên có ý nghĩa, giúp người đọc dễ dàng hiểu được features.

- **Document & Comment**: 
  - Doc hướng dẫn chi tiết cho từng contract, bao gồm mô tả feature, các lỗi có thể xảy ra, và cách sử dụng. Các comment trong source code cũng được giải thích các phần quan trọng.

- **Tính sáng tạo**: 
  - Các contract cung cấp các feature độc đáo như tự động trừ phí transfer, quản lý đóng góp và khóa tài sản, cho phép user có nhiều lựa chọn trong việc quản lý tài sản.

- **Kiểm tra đầu vào và xử lý lỗi**: 
  - Mỗi fun đều có kiểm tra đầu vào để đảm bảo rằng các param được cung cấp là hợp lệ. Các lỗi được xử lý thông qua các thông báo lỗi rõ ràng, giúp user hiểu được vấn đề khi có lỗi xảy ra.

## Link Github repository
- [Github Repository](https://github.com/0xBoji/vbi-code-challenge/tree/week-1/0xboji)

## Các link resources liên quan đến bài thi
- [AutoWallet](https://sepolia.etherscan.io/address/0x4a03d175e48473d876595767c80476de3cd4313c)

- [SimpleTimeLock](https://sepolia.etherscan.io/address/0x11243113117fa527e73b8d3a763c112027c28219)

- [ContributionCounter](https://sepolia.etherscan.io/address/0x243bf6acfe953aa3fe551b7684af0a47eedeafad)