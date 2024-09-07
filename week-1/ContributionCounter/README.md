# Contract ContributionCounter

Contract `ContributionCounter` cho phép user contribute một số tiền nhất định và rút lại số tiền đó sau một khoảng thời gian khóa (giống DAO kết hợp Staking). Contract cũng cho phép owner cập nhật giới hạn contribute tối đa và thời gian khóa rút tiền.

## Các thành phần chính

### 1. Các lỗi (Errors)
- `InsufficientContribution`: Emit khi user cố gắng contribute số tiền nhỏ hơn hoặc bằng 0.
- `AlreadyContributed`: Emit khi user đã contribute trước đó.
- `NotOwner`: Emit khi một người không phải là owner cố gắng thực hiện các chức năng chỉ dành cho owner.
- `InsufficientBalance`: Emit khi contract không đủ số dư để thực hiện giao dịch.
- `ContributionLimitExceeded`: Emit khi user cố gắng contribute vượt quá giới hạn tối đa.
- `WithdrawalsNotAllowedYet`: Emit khi user cố gắng rút tiền trước khi hết thời gian khóa.

### 2. Các State Var:
- `userToAmount`: Lưu trữ số tiền mà mỗi user đã contribute.
- `contributionTimestamp`: Lưu trữ thời gian mà user đã thực hiện contribute.
- `totalContributors`: Tổng số user đã contribute.
- `owner`: Địa chỉ của owner contract.
- `maxContribution`: Giới hạn tối đa cho mỗi lần contribute.
- `withdrawalLockTime`: Thời gian khóa rút tiền.

### 3. Các Events:
- `Contributed`: Emit khi một user thực hiện contribute.
- `Withdrawn`: Emit khi một user rút tiền.
- `OwnerWithdrawn`: Emit khi owner rút tiền.
- `MaxContributionUpdated`: Emit khi giới hạn contribute tối đa được cập nhật.
- `WithdrawalLockTimeUpdated`: Emit khi thời gian khóa rút tiền được cập nhật.

### 4. Các Func:
- `contribute()`: Cho phép user contribute một số tiền. 
- `withdraw(uint256 amount)`: Cho phép user rút một số tiền nhất định sau khi hết thời gian khóa.
- `ownerWithdraw(uint256 amount)`: Cho phép owner rút tiền từ contract.
- `updateMaxContribution(uint256 newMaxContribution)`: Cho phép owner cập nhật giới hạn contribute tối đa.
- `updateWithdrawalLockTime(uint256 newLockTime)`: Cho phép owner cập nhật thời gian khóa rút tiền.
- `getUserContribution()`: Trả về số tiền mà user đã contribute.
- `getTotalContributors()`: Trả về tổng số user đã contribute.

## Ví dụ:

Giả sử Bob muốn contribute 1 Eth vào contract và Alice là owner contract.

1. **Bob contribute**:
   - Bob gọi hàm `contribute` với số tiền là 1 Eth.
   - Contract sẽ lưu trữ thông tin contribute và emit event `Contributed`.

2. **Bob rút tiền**:
   - Sau khi thời gian khóa đã hết, Bob có thể gọi hàm `withdraw` để rút 0.5 Eth.
   - Contract sẽ kiểm tra điều kiện và cho phép Bob rút tiền.

3. **Alice cập nhật giới hạn contribute**:
   - Alice muốn thay đổi giới hạn contribute tối đa thành 2 Eth, alice gọi hàm `updateMaxContribution`.
   - Contract sẽ cập nhật giới hạn và emit event `MaxContributionUpdated`.

4. **Alice rút tiền**:
   - Alice muốn rút 1 Eth từ contract, alice gọi hàm `ownerWithdraw`.
   - Contract sẽ thực hiện giao dịch và emit event `OwnerWithdrawn`.
