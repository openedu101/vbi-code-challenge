# Bài thi của Nguyễn Ngọc Anh Khoa

Smart contract Contribution Counter quản lý các đóng góp từ người dùng. Người dùng chỉ có thể đóng góp một lần. Contract lưu trữ thông tin đóng góp của mỗi người dùng và cho phép chủ sở hữu rút tiền khi cần. Contract có các chức năng sau:
- contribute(): Cho phép người dùng đóng góp tiền, đảm bảo rằng mỗi người dùng chỉ có thể đóng góp một lần.
- getContributions(): Trả về danh sách tất cả các đóng góp đã được thực hiện.
- withdraw(): Cho phép chủ sở hữu rút tiền từ contract.

Đánh giá: 
- Contract kiểm tra người dùng đã đóng góp chưa và số tiền đóng góp có hợp lệ hay không trong contribute().
- Hàm withdraw() kiểm tra số dư của contract trước khi thực hiện việc rút tiền.
- Contract sử dụng mảng động contributions để lưu trữ thông tin đóng góp. Điều này có thể trở nên không hiệu quả nếu số lượng đóng góp tăng lên lớn, vì việc sao chép mảng khi gọi getContributions() có thể tiêu tốn gas.


- Link Github repository: https://github.com/anhkhoa55nn/vbiw1/blob/main/VBI_Bootcamp.sol