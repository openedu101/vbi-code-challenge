# Bài thi của Phạm Hồng Thái

Mô tả ngắn về bài thi của bạn.

## Auto wallet

- Hợp đồng thông minh được khởi tạo với **_owner_** (chủ hợp đồng), **\*receiver** (người nhận cố định) và **_fee_** (tỉ lệ phần trăm số ETH giữ lại trong hợp đồng)

- Người dùng gửi một số lượng Ether bất kỳ vào hợp đồng.

- Hợp đồng sẽ giữ lại một tỷ lệ phần trăm nhất định **_fee_** và chuyển phần còn lại đến một địa chỉ **_receiver_**.

- Một số hàm phụ trợ như **_setReceiver_** và **_setFeePercent_**

## Simple Time Lock

- Hợp đồng thông minh được khởi tạo không tham số

- User gọi hàm **_lock_** với tham số thời gian unlock cùng với số ETH muốn lock

- Kiểm tra các ràng buộc trước khi unlock

## Contribution Counter
