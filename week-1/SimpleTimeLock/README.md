# Contract SimpleTimeLock

Contract `SimpleTimeLock` cho phép user khóa Eth trong một khoảng thời gian xác định (Tương tự stake eth trên dex hay farming). Sau khi thời gian khóa kết thúc, user có thể rút Eth đã khóa. Contract cũng cho phép user hủy khóa và hoàn lại Eth nếu cần.

## Tính năng:
- **Khóa Eth**: user có thể khóa Eth với một thời gian khóa cụ thể.
- **Rút Eth**: user có thể rút Eth sau khi thời gian khóa đã hết.
- **Hủy khóa**: user có thể hủy khóa và nhận lại toàn bộ Eth đã khóa.
- **Kiểm tra khóa sắp hết hạn**: user có thể kiểm tra xem khóa nào sắp hết hạn trong vòng 1 ngày.

## Error handling:
- `NotFutureUnlockTime`: Thời gian mở khóa không hợp lệ.
- `NoEthToWithdraw`: Không có Eth nào để rút.
- `EthStillLocked`: Eth vẫn đang bị khóa và không thể rút.
- `InvalidDepositIndex`: Số khóa không hợp lệ.
- `ZeroEth`: Không thể khóa 0 Eth.
- `InsufficientAmount`: Số lượng Eth yêu cầu rút lớn hơn số lượng đã khóa.
- `LockAlreadyCanceled`: Khóa đã bị hủy.

## Các state var:
- **Lock Struct**:
  - `uint256 amount`: Số lượng Eth đã khóa.
  - `uint256 unlockTime`: Thời gian khi Eth có thể được rút.
  - `string name`: Tên của khóa ng dùng đặt.
  - `bool isCanceled`: Flag để check hay set xem khóa đã bị hủy hay chưa.

- `mapping(address => Lock[]) public locks`: Theo dõi các khóa của user.

## Các Event:
- `EthLocked(address indexed user, uint256 amount, uint256 unlockTime, string name)`: Event được emit khi Eth được khóa.
- `EthWithdrawn(address indexed user, uint256 amount)`: Event được emit khi Eth được rút.
- `LockCanceledEvent(address indexed user, uint256 amount, string name)`: Event được emit khi khóa bị hủy.
- `LockExpiringSoon(address indexed user, uint256 unlockTime, string name)`: Event được emit khi khóa sắp hết hạn.

## Các fun:
- `lockEth(uint256 _lockDuration, string calldata _name)`: Khóa Eth với thời gian khóa và tên xác định.
- `withdrawEth(uint256 _index, uint256 _amount)`: Rút Eth từ khóa đã chỉ định.
- `cancelLock(uint256 _index)`: Hủy khóa và hoàn lại Eth.
- `getUserLocks()`: Trả về danh sách các khóa của user.
- `checkExpiringLocks()`: Kiểm tra và emit event cho các khóa sắp hết hạn.

## Ví dụ sử dụng
Giả sử Alice muốn khóa 1 Eth trong 3 ngày với tên khóa là "Khóa 1".

1. **Khóa Eth**:
   - Alice gọi fun `lockEth` với các param:
     - `_lockDuration`: `259200`.
     - `amout`: không được là 0.
     - `_name`: `"Khóa 1"`.
   - Contract sẽ lưu trữ thông tin khóa và emit event `EthLocked`.

2. **Rút Eth**:
   - Sau 3 ngày, Alice có thể gọi fun `withdrawEth` với các param:
     - `_index`: `0` (nếu đây là khóa đầu tiên).
     - `_amount`: `1 Eth`.
   - Contract sẽ kiểm tra thời gian và cho phép Alice rút Eth.

3. **Hủy khóa**:
   - Nếu Alice muốn hủy khóa trước khi hết thời gian, cô ấy có thể gọi fun `cancelLock` với `_index` là `0`.
   - Contract sẽ hoàn lại 1 Eth cho Alice và emit event `LockCanceledEvent`.

4. **Kiểm tra khóa sắp hết hạn**:
   - Alice có thể gọi fun `checkExpiringLocks` để kiểm tra xem có khóa nào sắp hết hạn trong vòng 1 ngày hay không. Nếu có, Contract sẽ emit event `LockExpiringSoon`.

## Creative:

- Contract có một số fun thêm vào để user hoặc owner có thể customize data, logic contract.
- View fun giúp user kiểm tra vault nào sắp được mở.