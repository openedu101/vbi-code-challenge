# Bài thi của Phạm Hồng Thái

Mô tả ngắn về bài thi của bạn.

## Auto wallet

- Hợp đồng thông minh được khởi tạo với **_owner_** (chủ hợp đồng), **\*receiver** (người nhận cố định) và **_fee_** (tỉ lệ phần trăm số ETH giữ lại trong hợp đồng)

- Người dùng gửi một số lượng Ether bất kỳ vào hợp đồng.

- Hợp đồng sẽ giữ lại một tỷ lệ phần trăm nhất định **_fee_** và chuyển phần còn lại đến một địa chỉ **_receiver_**.

- Một số hàm phụ trợ như **_setReceiver_** và **_setFeePercent_**

## Simple Time Lock

- Hợp đồng thông minh được khởi tạo với số lượng ETH và thời gian muốn mở khoá

- Khi thời gian kết thúc, người dùng có thể rút số Ether đã khóa.
