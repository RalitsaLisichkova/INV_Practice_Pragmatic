package ui;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

public class DashboardPage {
    private PageAction action;

    @FindBy(how = How.ID, using = "loginusername")
    private WebElement usernameField;

    @FindBy(how = How.XPATH, using = "//div[@class='userpanel-header']")
    private WebElement userPanel;

    @FindBy(how = How.XPATH, using = "//h1")
    private WebElement companyNameHeading;

    @FindBy(how = How.CSS, using = "a.selenium-button-logout.button-logout")
    private WebElement logoutLink;


    public DashboardPage(WebDriver driver) {
        PageFactory.initElements(driver, this);
        action = new PageAction(driver);
    }

    public String getUserPanelText(){
       return action.getText(userPanel);
    }

    public void logout(){
        action.clickButton(userPanel);
        action.clickButton(logoutLink);
    }

    public String getCompanyName() {
       return action.getText(companyNameHeading);
    }
}
