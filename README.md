## WrappingAnchor

### Simple wraping on NSLayoutAnchor


###### Example:
```Swift

carouselCollection?.position
    .left(to: view, dir: .right)
    .right(to: view, equal: .moreOrEqual)
    .bottom(to: view, const: -Constants.carouselBottomPadding)
    .height(const: Constants.carouselHeigh, priority: .medium)

```
