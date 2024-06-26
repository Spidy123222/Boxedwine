#ifndef __APP_BAR_H__
#define __APP_BAR_H__

class AppButton {
public:
    AppButton(BString name, std::function<void()> onSelect) : name(name), onSelect(onSelect) {}
    BString name;

    std::function<void()> onSelect;
};

void drawAppBar(const std::vector<AppButton>& buttons, int selected, ImFont* font);

#endif