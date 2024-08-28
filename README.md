# VBI Coding Challenge - Thử Thách Lập Trình Hàng Tuần

**Coding Challenge** là chuỗi thử thách lập trình diễn ra hàng tuần, giúp bạn kiểm tra và phát triển kỹ năng lập trình của mình thông qua các bài tập thực tế.

Tuần hiện tại: [Tuần 1](#tuần-1-2608---0109)

- [VBI Coding Challenge - Thử Thách Lập Trình Hàng Tuần](#vbi-coding-challenge---thử-thách-lập-trình-hàng-tuần)
  - [Hoạt động như thế nào?](#hoạt-động-như-thế-nào)
  - [Quy trình tham gia](#quy-trình-tham-gia)
  - [Lợi ích khi tham gia](#lợi-ích-khi-tham-gia)
  - [Quy tắc chấm điểm](#quy-tắc-chấm-điểm)
  - [Hướng dẫn nộp bài qua GitHub Pull Request (PR)](#hướng-dẫn-nộp-bài-qua-github-pull-request-pr)
  - [Đề bài và giải thưởng](#đề-bài-và-giải-thưởng)
    - [Tuần 1 (26/08 - 01/09)](#tuần-1-2608---0109)
    - [Tuần 2 (02/09 - 08/09)](#tuần-2-0209---0809)
    - [Tuần 3 (09/09 - 15/09)](#tuần-3-0909---1509)
    - [Tuần 4 (16/09 - 22/09)](#tuần-4-1609---2209)
    - [Tuần 5 (23/09 - 29/09)](#tuần-5-2309---2909)
    - [Tuần 6 (30/09 - 06/10)](#tuần-6-3009---0610)
    - [Tuần 7 (07/10 - 13/10) - Tuần đặc biệt](#tuần-7-0710---1310---tuần-đặc-biệt)


## Hoạt động như thế nào?

- Mỗi tuần, một bài tập mới sẽ được đưa ra vào thứ 3.
- Người tham gia sẽ nộp bài qua GitHub kèm theo một post giải thích ngắn gọn về giải pháp của mình.
- Đăng bài giải của bạn lên **[VBI Vietnam Dev & Tech Forum](https://www.facebook.com/groups/529546081751025)**. Viết 1 đoạn mô tả ngắn về phương pháp giải, đính kèm link GitHub bài làm của minh + 1 số may mắn từ 00-99 + chuỗi hashtag: `#VBI #CodingChallenge # Web3Community #Web3Developer`.

## Quy trình tham gia

1. **Nhận đề bài**: Đề sẽ được công bố vào thứ 3 hàng tuần.
2. **Nộp bài**: Gửi bài giải của bạn qua GitHub, viết post giải thích và đăng lên diễn đàn hoặc nhóm cộng đồng. 
    Cách đăng bài xem [tại đây](#hướng-dẫn-nộp-bài-qua-github-pull-request-pr).
3. **Chấm bài và công bố kết quả**: Các bài làm sẽ được chấm và công bố kết quả vào thứ 2 tuần tiếp theo.

## Lợi ích khi tham gia
- Thử thách bản thân với những bài tập mới mỗi tuần.
- Cơ hội học hỏi từ những giải pháp sáng tạo của cộng đồng.
- Nhận giải thưởng hấp dẫn hàng tuần.

## Quy tắc chấm điểm

Sau khi nộp bài, Ban giám khảo sẽ đánh giá bài dựa trên thang điểm 100 với các tiêu chí **ví dụ** sau:

1. **Tính chính xác (40%)**  
   Code có giải quyết được đề bài hay không?

2. **Hiệu suất (20%)**  
   Code có tối ưu không? Nếu có, tối ưu ở mức độ nào?

3. **Code Style & Clean Code (10%)**  
   - Code có dễ đọc và dễ hiểu không?  
   - Có tuân thủ theo các nguyên tắc coding style không?

4. **Document & Comment (10%)**  
   - Có README giải thích cách chạy code không?  
   - Có comment giải thích các phần phức tạp không?

5. **Tính sáng tạo (10%)**  
   Có gì sáng tạo hay bất ngờ không?

6. **Kiểm tra đầu vào và xử lý lỗi (10%)**  
   - Code có kiểm tra đầu vào hợp lý không?  
   - Có xử lý lỗi một cách hợp lý không?

**Lưu ý:** Nếu hai bài có cùng số điểm, bài nộp sớm hơn sẽ được ưu tiên. 

Quy tắc chấm điểm sẽ thay đổi theo từng tuần, hãy chú ý quy tắc chấm điểm trong từng đề bài để có một kết quả tốt hơn.

## Hướng dẫn nộp bài qua GitHub Pull Request (PR)

Để nộp bài tham gia Coding Challenge qua Pull Request trên GitHub, hãy làm theo các bước sau:

1. **Push code của bạn lên Github**

1. **Fork repo gốc**:
   - Truy cập vào repo của Coding Challenge trên GitHub.
   - Nhấn nút "Fork" ở góc trên bên phải để tạo một bản sao repo vào tài khoản của bạn.
  
2. **Clone repo về máy**:
   - Clone repo mà bạn vừa fork về máy tính cá nhân của mình.
```bash
git clone https://github.com/<your-username>/<repo-name>.git
```

3. **Tạo nhánh mới**:
   - Tạo một nhánh mới để làm việc và đặt tên nhánh theo dạng <TUẦN>/<USERNAME_GITHUB>

Ví dụ: 
```bash
git checkout -b week-1/terrancrypt
```

4. **Nhập thông tin**:
   
   - Truy cập folder theo tuần, ở đây ví dụ tại đường dẫn: `week-1/Test.md`
   - Tạo một file markdown mới đặt tên theo Username Github. Ví dụ: `terrancrypt.md`
   - Nhập các thông tin cần thiết theo layout sau:
```
# Bài thi của <Tên của bạn>

Mô tả ngắn về bài thi của bạn. Bao gồm bạn hãy tự đánh giá:
    - Tính chính xác
    - Hiệu suất
    - Code Style & Clean Code
    - Document & Comment
    - Tính sáng tạo
    - Kiểm tra đầu vào và xử lý lỗi 

Phần tự đánh giá là tuỳ chọn. Tuy nhiên nếu có thì còn hơn không nha!

- Link Github repository tới bài thi của bạn (hãy nhớ để trạng thái public)
- Các link resources liên quan đến bài thi nếu có (ví dụ deployment link).
```

5. **Tạo Pull Request (PR):**

Quay lại repo gốc của Coding Challenge.
Nhấn nút "Compare & Pull Request" và viết mô tả ngắn gọn về bài giải của bạn.

6. **Đăng bài:**

Đăng bài giải của bạn lên **[VBI Vietnam Dev & Tech Forum](https://www.facebook.com/groups/529546081751025)**. Viết 1 đoạn mô tả ngắn về phương pháp giải, đính kèm link GitHub bài làm của minh + 1 số may mắn từ 00-99 + chuỗi hashtag: `#VBI #CodingChallenge # Web3Community #Web3Developer`.

7. **Hoàn thành:**

Sau khi tạo PR, đợi ban giám khảo kiểm tra và đánh giá bài làm của bạn.

## Đề bài và giải thưởng

### Tuần 1 (26/08 - 01/09)
- **Giải 1**: Chuột gaming có dây MSI Clutch GM08 
- **Giải 2**: Voucher Got it 
- **Giải 3**: Voucher Got it 
- **Giải may mắn**: Voucher Got it

Đề bài xem [tại đây](https://github.com/openedu101/vbi-code-challenge/tree/week-1).

### Tuần 2 (02/09 - 08/09)


Đang cập nhật đề bài...

### Tuần 3 (09/09 - 15/09)


Đang cập nhật đề bài...

### Tuần 4 (16/09 - 22/09)


Đang cập nhật đề bài...

### Tuần 5 (23/09 - 29/09)


Đang cập nhật đề bài...

### Tuần 6 (30/09 - 06/10)


Đang cập nhật đề bài...

### Tuần 7 (07/10 - 13/10) - Tuần đặc biệt


Đang cập nhật đề bài...