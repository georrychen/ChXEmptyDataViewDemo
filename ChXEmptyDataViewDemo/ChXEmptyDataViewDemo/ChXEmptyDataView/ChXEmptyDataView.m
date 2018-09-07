
#import "ChXEmptyDataView.h"

@interface ChXEmptyDataView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

/**
 图片的 top 约束，默认 100
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewTopCons;
/**
 按钮的 top 约束，默认 40
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextButtonTopCons;

@end

@implementation ChXEmptyDataView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 设置按钮圆角
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.layer.cornerRadius = 20;
}

+ (instancetype)emptyDataView {
    ChXEmptyDataView *view =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 450);
    return view;
}

// MARK: xu - 配置视图显示类型

- (void)setShowType:(ChXEmptyViewType)showType {
    _showType = showType;
    
    switch (showType) {
        case EmptyTypeNoData: { // 无数据
            [self showNoDataView];
        }
            break;
        case EmptyTypeNoDataWithNextButton: { // 无数据，下一步按钮
            [self showNoDataWithButtonView];
        }
            break;
        case EmptyTypeError: { // 错误
            [self showErrorView];
        }
            break;
        case EmptyTypeNotLogin: { // 未登录
            [self showNoLoginView];
        }
            break;
        default:
            break;
    }
}

- (void)showNoDataView {
    self.nextButton.hidden = YES;
    self.detailLabel.hidden = YES;
    
    self.imageView.image = [UIImage imageNamed:@"emptyIcon_noData"];
    self.titleLabel.text = @"暂无数据";
}

- (void)showNoDataWithButtonView {
    self.nextButton.hidden = NO;
    self.detailLabel.hidden = YES;

    self.imageView.image = [UIImage imageNamed:@"emptyIcon_noData"];
    self.titleLabel.text = @"暂无数据";
}

- (void)showErrorView {
    self.detailLabel.hidden = YES;
    self.nextButton.hidden = NO;

    self.imageView.image = [UIImage imageNamed:@"emptyIcon_error"];
    self.titleLabel.text = @"数据加载失败";
    
    [self.nextButton setTitle:@"点击重试" forState:UIControlStateNormal];
}

- (void)showNoLoginView {
    self.detailLabel.hidden = YES;
    self.nextButton.hidden = NO;

    self.titleLabel.attributedText = [self attributedStringWithText: @"亲爱的, 您还未登录"];
    [self.nextButton setTitle:@"去登录" forState:UIControlStateNormal];
}

- (NSAttributedString *)attributedStringWithText:(NSString *)text {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:15.0],
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0],
                                 NSParagraphStyleAttributeName: paragraphStyle};
    
    // ，逗号前文字时灰色，后面是红色
    NSRange commaRange = [text rangeOfString:@" "];
    
    NSRange frontStringRange = NSMakeRange(0, commaRange.location);
    NSRange backStringRange = NSMakeRange(commaRange.location, text.length - commaRange.location);
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    // 设置不同 range 的文字颜色
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0] range:frontStringRange];
    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:250/255.0 green:87/255.0 blue:74/255.0 alpha:1.0] range:backStringRange];
    
    return attributeString;
}

// MARK: xu - 配置控件属性

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setAttributedTitle:(NSString *)attributedTitle {
    _attributedTitle = attributedTitle;
    
    self.titleLabel.attributedText = [self attributedStringWithText: attributedTitle];
}

- (void)setSubTitle:(NSString *)subTitle {
    _subTitle = subTitle;
    
    self.detailLabel.hidden = NO;
    self.detailLabel.text = subTitle;
    self.nextButtonTopCons.constant = 50;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    
    [self.nextButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonBackgroudColor:(UIColor *)buttonBackgroudColor {
    _buttonBackgroudColor = buttonBackgroudColor;
    
    self.nextButton.backgroundColor = buttonBackgroudColor;
}

// MARK: xu - 响应事件

- (IBAction)nextStepButtonSelected:(id)sender {
    if (self.nextButtonDidSelecteBlock) {
        self.nextButtonDidSelecteBlock((UIButton *)sender);
    }
}






@end
