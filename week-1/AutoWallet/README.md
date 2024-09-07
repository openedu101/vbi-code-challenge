# AutoWallet Contract

SC `AutoWallet` cho phép người dùng gửi eth đến một address contract, sau đó sc tự động trừ đi một khoản phí được xác định trước (default là 10%). SC này được build để đơn giản hóa việc tranfer và quản lý phí cho các transaction.

## Feature:
- **Owner contract**: Chỉ có owner contract mới có quyền thay đổi address ng nhận và tỷ lệ phí.
- **Người nhận**: Address sẽ nhận eth sau khi trừ phí.
- **Phí giao dịch**: Phí được tính theo tỷ lệ phần trăm (được set default là 10%).
- **Rút tiền**: owner contract có thể rút toàn bộ số eth còn lại trong sc.

## Error handling:
- `NotOwner`: Chỉ có owner mới có quyền thực hiện một số feat này.
- `InvalidRecipient`: Address người nhận không hợp lệ.
- `Zeroeth`: Không thể gửi 0 eth.
- `NoethToWithdraw`: Không có eth nào để rút.
- `InvalidFee`: Tỷ lệ phí không hợp lệ (phải nhỏ hơn hoặc bằng 100%).

## Các state vars:
- `address public owner`: Address của owner contract.
- `address payable public recipient`: address sẽ nhận eth đã chuyển.
- `uint256 public feePercentage`: Tỷ lệ phí (ví dụ: 100 = 1%).

## Các event:
- `Deposited(address indexed sender, uint256 amount, uint256 fee)`: Event được emit khi có eth được gửi vào contract.
- `Transferred(address indexed recipient, uint256 amount)`: Event được emit khi eth được chuyển đến người nhận.
- `RecipientChanged(address indexed oldRecipient, address indexed newRecipient)`: Event được emit khi address người nhận được thay đổi.
- `FeeChanged(uint256 oldFee, uint256 newFee)`: Event được emit khi tỷ lệ phí được thay đổi.

## Các fun
- `constructor(address payable _recipient, uint256 _initFeePercentage)`: Khởi tạo contract với address người nhận và tỷ lệ phí default.
- `receive() external payable`: Hàm nhận eth và tự động chuyển đến người nhận sau khi trừ phí.
- `changeRecipient(address payable newRecipient)`: Hàm cho phép owner thay đổi address người nhận.
- `changeFeePercentage(uint256 newFeePercentage)`: Hàm cho phép owner thay đổi tỷ lệ phí.
- `withdraw() external onlyOwner`: Hàm cho phép owner rút toàn bộ số eth còn lại trong contract.

## Ví dụ:
Giả sử Bob là chủ sở hữu contract với address `0xOwner`, và Bob muốn set address người nhận là `0xRecipient` với tỷ lệ phí là 10%.

1. **Deploy contract**:
   - 0xBob deploy contract `AutoWallet` với các param:
     - `_recipient`: `0xRecipient`
     - `_initFeePercentage`: `1000` (~ 10%)

2. **Gửi eth**:
   - 0xCAFE gửi 1 eth đến contract. contract sẽ tự động trừ đi 10% (0.1 eth) làm phí và chuyển 0.9 eth đến address `0xRecipient`.

3. **Thay đổi người nhận**:
   - Nếu 0xBob muốn thay đổi address người nhận, 0xBob có thể gọi hàm `changeRecipient` với tham số mới, ví dụ: `0xNewRecipient`.

4. **Rút tiền**:
   - 0xBob có thể rút toàn bộ số eth còn lại trong contract bằng cách gọi hàm `withdraw`.

## Creative:

- Contract có một số hàm thêm vào để user hoặc owner có thể customize data, logic contract.