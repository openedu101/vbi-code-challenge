# VBI Coding Challenge Tuần 1

## Giải thưởng

### Tuần 1 (26/08 - 01/09)
- **Giải 1**: Chuột gaming có dây MSI Clutch GM08 (~400k)
- **Giải 2**: Voucher Got it (200k)
- **Giải 3**: Voucher Got it (100k)
- **Giải may mắn**: Voucher Got it (100k)

## Đề bài

Có 3 đề bài cho tuần này!!! Bạn có thể chọn 1 trong 3.

### 1. Ví Tự Động (Auto Wallet)
Xây dựng hợp đồng thông minh cho phép người dùng gửi Ether vào ví, và hợp đồng sẽ tự động chuyển một phần nhỏ số Ether đó đến địa chỉ khác.

Yêu cầu:
- Người dùng gửi một số lượng Ether bất kỳ vào hợp đồng.
- Hợp đồng sẽ giữ lại một tỷ lệ phần trăm nhất định (ví dụ: 10%) và chuyển phần còn lại đến một địa chỉ người nhận cố định.

### 2. Khóa Thời Gian Đơn Giản (Simple Time Lock)
Tạo một hợp đồng thông minh cho phép người dùng khóa Ether trong một khoảng thời gian nhất định và chỉ có thể rút sau khi hết thời gian khóa.

Yêu cầu:
- Người dùng có thể khóa Ether với thời gian mở khóa được đặt trước.
- Khi thời gian kết thúc, người dùng có thể rút số Ether đã khóa.

### 3. Đếm Số Người Đóng Góp (Contribution Counter)
Tạo một hợp đồng để đếm số lượng người đóng góp (bằng cách gửi một lượng nhỏ Ether vào hợp đồng) và ghi lại địa chỉ của từng người.

Yêu cầu:
- Mỗi người dùng chỉ có thể đóng góp một lần.
- Hợp đồng ghi lại số lượng đóng góp và địa chỉ của từng người.

Tất cả contract đều cần được deploy và verify trên mạng [Sepolia Testnet](https://sepolia.etherscan.io/). Xem kỹ hơn tiêu chí chấm điểm bên dưới.

## Quy tắc chấm điểm

Sau khi nộp bài, Ban giám khảo sẽ đánh giá bài dựa trên thang điểm 100 với các tiêu chí sau:

1. **Tính chính xác (40%)**  
   
   Code có giải quyết được đề bài hay không?

2. **Testing (20%)**
   
   Code có testing bằng thư viện Hardhat hoặc Foundry hay không? Nếu có test thì độ bao phủ là bao nhiêu %.

3. **Hiệu suất  & Clean Code (20%)** 
   
   - Code có dễ đọc và dễ hiểu không? 
   - Có giải quyết vấn đề với số lượng code tối thiểu không?
   - Có lỗ hổng bảo mật nào có thể phát sinh trong code?
  
4. **Document & Code Style (10%)**  

   - Có tuân thủ theo các nguyên tắc coding style không?
   - Có README giải thích cách chạy code hay cách để chạy các test file không?
   - Có comment giải thích các phần phức tạp không?

5. **Deploy & Verify Contract (10%)**

   Code có deploy và verify contract trên [Ethereum Sepolia Network](https://sepolia.etherscan.io/) hay không? Nếu có thì hãy parse link ra nhé.

**Lưu ý:** Nếu hai bài có cùng số điểm, bài nộp sớm hơn sẽ được ưu tiên. 