#ifndef __BASE_VIEW_H__
#define __BASE_VIEW_H__

class BaseViewTab {
public:
	BaseViewTab(const std::string& name, const std::shared_ptr<ImGuiLayout>& model, std::function<void(bool buttonPressed, BaseViewTab& tab)> drawTab, std::function<void()> drawTabIcon) : name(name), drawTab(drawTab), model(model), drawTabIcon(drawTabIcon) {}
	std::string name;
	std::function<void(bool buttonPressed, BaseViewTab& tab)> drawTab;
	std::shared_ptr<ImGuiLayout> model;
	std::function<void()> drawTabIcon;
};

class BaseView {
public:
	BaseView(const std::string& viewName);
        virtual ~BaseView() {}

	virtual bool saveChanges()=0;
	void run(const ImVec2& size);

protected:
	float toolTipWidth;
	float extraVerticalSpacing;

	void addTab(const std::string& name, const std::shared_ptr<ImGuiLayout>& model, std::function<void(bool buttonPressed, BaseViewTab& tab)> drawTab, std::function<void()> drawTabIcon=nullptr);
	void runErrorMsg(bool open);
	int getTabCount() {return (int)tabs.size();}
	void setTabName(int index, const std::string& name) { tabs[index].name = name; }

	std::shared_ptr<LayoutComboboxControl> createWindowsVersionCombobox(const std::shared_ptr<LayoutSection>& section);
	std::shared_ptr<LayoutComboboxControl> createWineVersionCombobox(const std::shared_ptr<LayoutSection>& section);

	const char* errorMsg;
	std::string errorMsgString;
	int tabIndex;
private:
	void addTab(const std::string& name, int index, const std::function<void()>& drawTabIcon);
		
	std::string viewName;
	std::vector<BaseViewTab> tabs;
	bool errorMsgOpen;
	bool tabChanged;
};

#endif