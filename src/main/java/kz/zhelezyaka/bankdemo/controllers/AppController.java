package kz.zhelezyaka.bankdemo.controllers;

import kz.zhelezyaka.bankdemo.models.Account;
import kz.zhelezyaka.bankdemo.models.PaymentHistory;
import kz.zhelezyaka.bankdemo.models.TransactionHistory;
import kz.zhelezyaka.bankdemo.models.User;
import kz.zhelezyaka.bankdemo.repository.AccountRepository;
import kz.zhelezyaka.bankdemo.repository.PaymentHistoryRepository;
import kz.zhelezyaka.bankdemo.repository.TransactHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/app")
public class AppController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PaymentHistoryRepository paymentHistoryRepository;

    @Autowired
    private TransactHistoryRepository transactHistoryRepository;

    User user;

    @GetMapping("/dashboard")
    public ModelAndView getDashboard(HttpSession session) {
        ModelAndView getDashboardPage = new ModelAndView("dashboard");

        user = (User) session.getAttribute("user");

        List<Account> getUserAccounts = accountRepository.getUserAccountsById(user.getUser_id());

        BigDecimal totalAccountsBalance = accountRepository.getTotalBalance(user.getUser_id());

        getDashboardPage.addObject("userAccounts", getUserAccounts);
        getDashboardPage.addObject("totalBalance", totalAccountsBalance);

        return getDashboardPage;
    }

    @GetMapping("/payment_history")
    public ModelAndView getPaymentHistory(HttpSession session) {

        ModelAndView getPaymentHistoryPage = new ModelAndView("paymentHistory");

        user = (User) session.getAttribute("user");

        List<PaymentHistory> userPaymentHistory = paymentHistoryRepository.getPaymentRecordsById(user.getUser_id());

        getPaymentHistoryPage.addObject("payment_history", userPaymentHistory);

        return getPaymentHistoryPage;
    }

    @GetMapping("/transact_history")
    public ModelAndView getTransactHistory(HttpSession session) {

        ModelAndView getTransactHistoryPage = new ModelAndView("transactHistory");

        user = (User) session.getAttribute("user");

        List<TransactionHistory> userTransactHistory = transactHistoryRepository.getTransactionRecordsById(user.getUser_id());

        getTransactHistoryPage.addObject("transact_history", userTransactHistory);

        return getTransactHistoryPage;
    }
}