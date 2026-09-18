import 'package:flutter/material.dart';
import 'package:bankease/core/utils/money.dart';
import 'package:bankease/features/accounts/domain/accounts.dart';

/// Gradient card with a show/hide balance toggle button. Displays the account holder's name and current balance.
/// Uses a stack to place a large faded bank icon behind the text.
class BalanceCard extends StatefulWidget {
  final Account account;
  final VoidCallback? onTap;

  const BalanceCard({super.key, required this.account, this.onTap});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  //privacy first: balance is hidden by default
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final account = widget.account;
    final onCard = scheme.primary;

    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [scheme.primary, scheme.tertiary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -24,
                child: Icon(
                  Icons.account_balance,
                  color: onCard.withAlpha(30),
                  size: 140,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${account.type.label} - ${account.maskedNumber}',
                      style: TextStyle(color: onCard),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Available balance',
                      style: TextStyle(color: onCard.withAlpha(200)),
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _hidden
                                ? '₹ * * * * * * * *'
                                : formatRupees(account.balancePaise),
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: onCard,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),

                        IconButton(
                          tooltip: _hidden ? 'Show balance' : 'Hide balance',
                          onPressed: () => setState(() => _hidden = !_hidden),
                          icon: Icon(
                            _hidden ? Icons.visibility : Icons.visibility_off,
                            color: onCard,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(account.holderName, style: TextStyle(color: onCard)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
